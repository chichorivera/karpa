import type { APIRoute } from 'astro'
import { supabaseAdmin } from '../../../../lib/supabase'

export const POST: APIRoute = async ({ request, redirect }) => {
  const form      = await request.formData()
  const bookingId = form.get('bookingId')?.toString()

  if (!bookingId) return new Response('Missing bookingId', { status: 400 })

  await supabaseAdmin
    .from('bookings')
    .update({ status: 'cancelled' })
    .eq('id', bookingId)

  return redirect('/host/bookings')
}
