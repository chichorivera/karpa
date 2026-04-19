import type { APIRoute } from 'astro'
import { getSessionUser, supabaseAdmin } from '../../../lib/supabase'

export const POST: APIRoute = async ({ request, cookies, redirect }) => {
  const { user, profile } = await getSessionUser(cookies)
  if (!user || profile?.role !== 'traveler') return redirect('/auth/login', 302)

  const form      = await request.formData()
  const campingId = form.get('campingId')?.toString()
  const hostId    = form.get('hostId')?.toString()

  if (!campingId || !hostId) return redirect('/search', 302)

  // Find or create conversation
  const { data: existing } = await supabaseAdmin
    .from('conversations')
    .select('id')
    .eq('camping_id', campingId)
    .eq('traveler_id', user.id)
    .single()

  if (existing) return redirect(`/app/messages/${existing.id}`, 302)

  const { data: conv, error } = await supabaseAdmin
    .from('conversations')
    .insert({ camping_id: campingId, traveler_id: user.id, host_id: hostId })
    .select('id')
    .single()

  if (error || !conv) return redirect(`/camping`, 302)

  return redirect(`/app/messages/${conv.id}`, 302)
}
