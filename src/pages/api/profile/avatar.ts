import type { APIRoute } from 'astro'
import { getSessionUser, supabaseAdmin } from '../../../lib/supabase'

export const POST: APIRoute = async ({ request, cookies }) => {
  const { user } = await getSessionUser(cookies)
  if (!user) return new Response(JSON.stringify({ error: 'Unauthorized' }), { status: 401 })

  const form = await request.formData()
  const file = form.get('avatar') as File | null
  if (!file || file.size === 0)
    return new Response(JSON.stringify({ error: 'No file' }), { status: 400 })

  const buf  = await file.arrayBuffer()
  const path = `${user.id}.jpg`

  const { error: upErr } = await supabaseAdmin.storage
    .from('avatars')
    .upload(path, buf, { contentType: 'image/jpeg', upsert: true })

  if (upErr)
    return new Response(JSON.stringify({ error: upErr.message }), { status: 500 })

  const { data: { publicUrl } } = supabaseAdmin.storage.from('avatars').getPublicUrl(path)

  // Add cache-bust so the browser reloads the image
  const avatarUrl = `${publicUrl}?t=${Date.now()}`

  await supabaseAdmin.from('profiles').update({ avatar_url: avatarUrl }).eq('id', user.id)

  return new Response(JSON.stringify({ url: avatarUrl }), { status: 200 })
}
