// Setea password 1q2w3e4r a todos los usuarios seed via Admin API
// node scripts/reset-passwords.mjs

import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://wfzmkmzghccaemcghquv.supabase.co'
const SERVICE_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indmem1rbXpnaGNjYWVtY2docXV2Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NjU2MjY1OSwiZXhwIjoyMDkyMTM4NjU5fQ.UBcRrN0-NY3gokSbwozllNKMTmOPTBMgE0kZm2id2fo'
const PASSWORD     = '1q2w3e4r'

const sb = createClient(SUPABASE_URL, SERVICE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false }
})

const EMAILS = [
  'admin@karpa.cl',
  'carlos.mendoza@karpa.cl',
  'maria.gonzalez@karpa.cl',
  'pedro.rojas@karpa.cl',
  'ana.martinez@karpa.cl',
  'luis.fernandez@karpa.cl',
  'carmen.lopez@karpa.cl',
  'jorge.sanchez@karpa.cl',
  'valentina.torres@karpa.cl',
  'roberto.diaz@karpa.cl',
  'sofia.munoz@karpa.cl',
  'viajero1@karpa.cl',
  'viajero2@karpa.cl',
  'viajero3@karpa.cl',
]

async function sleep(ms) { return new Promise(r => setTimeout(r, ms)) }

async function main() {
  console.log('🔑 Obteniendo usuarios...')
  const { data, error } = await sb.auth.admin.listUsers({ perPage: 100 })
  if (error) { console.error('Error listando usuarios:', error.message); process.exit(1) }

  const users = data.users.filter(u => EMAILS.includes(u.email))
  console.log(`   Encontrados: ${users.length} de ${EMAILS.length} esperados\n`)

  for (const u of users) {
    const { error: err } = await sb.auth.admin.updateUserById(u.id, { password: PASSWORD })
    if (err) {
      console.log(`  ✗ ${u.email}: ${err.message}`)
    } else {
      console.log(`  ✓ ${u.email}`)
    }
    await sleep(150)
  }

  // Crear los que no existen
  const existingEmails = users.map(u => u.email)
  const missing = EMAILS.filter(e => !existingEmails.includes(e))
  if (missing.length > 0) {
    console.log(`\n⚠️  No encontrados (${missing.length}), creando...`)
    for (const email of missing) {
      const { error: err } = await sb.auth.admin.createUser({
        email, password: PASSWORD, email_confirm: true
      })
      console.log(err ? `  ✗ ${email}: ${err.message}` : `  ✓ creado ${email}`)
      await sleep(200)
    }
  }

  console.log('\n✅ Listo — password 1q2w3e4r aplicado a todos los usuarios')
}

main().catch(e => { console.error(e); process.exit(1) })
