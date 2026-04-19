// Recrea los 14 usuarios seed via Admin API (asume que los viejos ya fueron borrados por SQL)
// Paso 1 — Ejecutar en Supabase SQL Editor:
//   DELETE FROM auth.users WHERE email LIKE '%karpa.cl' AND email != 'test.admin2@karpa.cl' AND email != 'test.nuevo2@karpa.cl';
// Paso 2 — node scripts/recreate-users.mjs

import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://wfzmkmzghccaemcghquv.supabase.co'
const SERVICE_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indmem1rbXpnaGNjYWVtY2docXV2Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NjU2MjY1OSwiZXhwIjoyMDkyMTM4NjU5fQ.UBcRrN0-NY3gokSbwozllNKMTmOPTBMgE0kZm2id2fo'
const PASSWORD     = '1q2w3e4r'

const sb = createClient(SUPABASE_URL, SERVICE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false }
})

const USERS = [
  { email: 'admin@karpa.cl',            full_name: 'Administrador Karpa', role: 'admin'    },
  { email: 'carlos.mendoza@karpa.cl',   full_name: 'Carlos Mendoza',      role: 'host'     },
  { email: 'maria.gonzalez@karpa.cl',   full_name: 'María González',      role: 'host'     },
  { email: 'pedro.rojas@karpa.cl',      full_name: 'Pedro Rojas',         role: 'host'     },
  { email: 'ana.martinez@karpa.cl',     full_name: 'Ana Martínez',        role: 'host'     },
  { email: 'luis.fernandez@karpa.cl',   full_name: 'Luis Fernández',      role: 'host'     },
  { email: 'carmen.lopez@karpa.cl',     full_name: 'Carmen López',        role: 'host'     },
  { email: 'jorge.sanchez@karpa.cl',    full_name: 'Jorge Sánchez',       role: 'host'     },
  { email: 'valentina.torres@karpa.cl', full_name: 'Valentina Torres',    role: 'host'     },
  { email: 'roberto.diaz@karpa.cl',     full_name: 'Roberto Díaz',        role: 'host'     },
  { email: 'sofia.munoz@karpa.cl',      full_name: 'Sofía Muñoz',         role: 'host'     },
  { email: 'viajero1@karpa.cl',         full_name: 'Juan Pérez',          role: 'traveler' },
  { email: 'viajero2@karpa.cl',         full_name: 'Claudia Ramos',       role: 'traveler' },
  { email: 'viajero3@karpa.cl',         full_name: 'Matías Herrera',      role: 'traveler' },
]

function sleep(ms) { return new Promise(r => setTimeout(r, ms)) }

async function main() {
  console.log('✨ Creando usuarios via Admin API...\n')

  const created = []

  for (const u of USERS) {
    const { data, error } = await sb.auth.admin.createUser({
      email:         u.email,
      password:      PASSWORD,
      email_confirm: true,
      user_metadata: { full_name: u.full_name },
    })

    if (error) {
      console.log(`  ✗ ${u.role.padEnd(8)} ${u.email}: ${error.message}`)
    } else {
      console.log(`  ✓ ${u.role.padEnd(8)} ${u.email}`)
      created.push({ uid: data.user.id, ...u })
    }
    await sleep(300)
  }

  // Actualizar roles en profiles
  console.log('\n📝 Actualizando roles...')
  for (const u of created) {
    const { error } = await sb.from('profiles')
      .update({ full_name: u.full_name, role: u.role })
      .eq('id', u.uid)
    if (error) console.log(`  ✗ ${u.email}: ${error.message}`)
    else console.log(`  ✓ ${u.role.padEnd(8)} ${u.full_name}`)
  }

  // Reasignar campings a los nuevos IDs de host
  const hosts = created.filter(u => u.role === 'host')
  if (hosts.length > 0) {
    console.log('\n🏕️  Reasignando campings...')

    // Los campings tienen owner_id = UUIDs deterministas del seed SQL
    // Los mapeamos por posición (índice 2-11 en USERS)
    const oldIds = [
      '00000002-0000-4000-8000-000000000000',
      '00000003-0000-4000-8000-000000000000',
      '00000004-0000-4000-8000-000000000000',
      '00000005-0000-4000-8000-000000000000',
      '00000006-0000-4000-8000-000000000000',
      '00000007-0000-4000-8000-000000000000',
      '00000008-0000-4000-8000-000000000000',
      '00000009-0000-4000-8000-000000000000',
      '00000010-0000-4000-8000-000000000000',
      '00000011-0000-4000-8000-000000000000',
    ]

    for (let i = 0; i < hosts.length; i++) {
      const { error, count } = await sb.from('campings')
        .update({ owner_id: hosts[i].uid })
        .eq('owner_id', oldIds[i])
        .select('id', { count: 'exact', head: true })
      if (error) console.log(`  ✗ ${hosts[i].email}: ${error.message}`)
      else console.log(`  ✓ ${hosts[i].full_name}`)
    }
  }

  console.log(`\n✅ Listo — ${created.length}/14 usuarios creados`)
  console.log(`   Password: ${PASSWORD}`)
}

main().catch(e => { console.error(e); process.exit(1) })
