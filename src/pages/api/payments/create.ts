import type { APIRoute } from 'astro'
import { WebpayPlus, Environment, Options, IntegrationCommerceCodes, IntegrationApiKeys } from 'transbank-sdk'
import { supabaseAdmin, getSessionUser } from '../../../lib/supabase'

export const POST: APIRoute = async ({ request, cookies, redirect }) => {
  const { user } = await getSessionUser(cookies)
  if (!user) return new Response(JSON.stringify({ error: 'No autenticado' }), { status: 401 })

  const { unitId, campingId, checkin, checkout, guests, total } = await request.json()
  if (!unitId || !checkin || !checkout || !total) {
    return new Response(JSON.stringify({ error: 'Datos incompletos' }), { status: 400 })
  }

  const isProd = import.meta.env.TBK_ENVIRONMENT === 'production'
  const tx = new WebpayPlus.Transaction(
    isProd
      ? new Options(import.meta.env.TBK_COMMERCE_CODE, import.meta.env.TBK_API_KEY, Environment.Production)
      : new Options(IntegrationCommerceCodes.WEBPAY_PLUS, IntegrationApiKeys.WEBPAY, Environment.Integration)
  )

  const { data: booking, error: bookingError } = await supabaseAdmin
    .from('bookings')
    .insert({ unit_id: unitId, camping_id: campingId, traveler_id: user.id, check_in: checkin, check_out: checkout, guests, total_price: total, status: 'pending', payment_status: 'unpaid' })
    .select('id').single()

  if (bookingError || !booking) {
    return new Response(JSON.stringify({ error: 'Error al crear reserva' }), { status: 500 })
  }

  const buyOrder  = `KARPA-${booking.id.substring(0, 8).toUpperCase()}`
  const sessionId = `SES-${Date.now()}`
  const returnUrl = `${import.meta.env.PUBLIC_BASE_URL}/api/payments/confirm`

  await supabaseAdmin.from('payments').insert({
    booking_id: booking.id, tbk_buy_order: buyOrder,
    tbk_session_id: sessionId, amount: total, status: 'pending',
  })

  try {
    const response = await tx.create(buyOrder, sessionId, Math.round(total), returnUrl)
    return new Response(JSON.stringify({ url: response.url, token: response.token }), {
      headers: { 'Content-Type': 'application/json' },
    })
  } catch {
    await supabaseAdmin.from('bookings').update({ status: 'cancelled' }).eq('id', booking.id)
    return new Response(JSON.stringify({ error: 'Error al conectar con Webpay' }), { status: 500 })
  }
}
