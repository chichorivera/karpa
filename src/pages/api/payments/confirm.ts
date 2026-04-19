import type { APIRoute } from 'astro'
import { WebpayPlus, Environment, Options, IntegrationCommerceCodes, IntegrationApiKeys } from 'transbank-sdk'
import { supabaseAdmin } from '../../../lib/supabase'
import { sendBookingConfirmedTraveler, sendBookingNotificationHost } from '../../../lib/email'

const getTx = () => {
  const isProd = import.meta.env.TBK_ENVIRONMENT === 'production'
  return new WebpayPlus.Transaction(
    isProd
      ? new Options(import.meta.env.TBK_COMMERCE_CODE, import.meta.env.TBK_API_KEY, Environment.Production)
      : new Options(IntegrationCommerceCodes.WEBPAY_PLUS, IntegrationApiKeys.WEBPAY, Environment.Integration)
  )
}

// Usuario completó el pago → GET con token_ws
export const GET: APIRoute = async ({ url, redirect }) => {
  const token = url.searchParams.get('token_ws')
  if (!token) return redirect('/app/booking/cancel?reason=no_token')

  return await commitPayment(token, redirect)
}

// Usuario abandonó el pago → POST con TBK_TOKEN
export const POST: APIRoute = async ({ request, redirect }) => {
  const form  = await request.formData()
  const token = form.get('TBK_TOKEN')?.toString()

  if (token) {
    // Anular la transacción abandonada
    await getTx().create('', '', 0, '').catch(() => {})
    const { data: payment } = await supabaseAdmin
      .from('payments')
      .select('booking_id')
      .eq('tbk_session_id', form.get('TBK_SESSION_ID')?.toString() ?? '')
      .single()

    if (payment?.booking_id) {
      await supabaseAdmin
        .from('bookings')
        .update({ status: 'cancelled' })
        .eq('id', payment.booking_id)
    }
    return redirect('/app/booking/cancel?reason=abandoned')
  }

  // Pago rechazado (token_ws en POST)
  const tokenWs = form.get('token_ws')?.toString()
  if (tokenWs) return await commitPayment(tokenWs, redirect)

  return redirect('/app/booking/cancel?reason=unknown')
}

async function commitPayment(token: string, redirect: (path: string) => Response) {
  try {
    const result = await getTx().commit(token)

    const { data: payment } = await supabaseAdmin
      .from('payments')
      .select('id, booking_id, amount')
      .eq('tbk_buy_order', result.buy_order)
      .single()

    if (!payment) return redirect('/app/booking/cancel?reason=not_found')

    if (result.response_code === 0) {
      // Pago aprobado
      await supabaseAdmin.from('payments').update({
        tbk_transaction_id: result.transaction_date,
        authorization_code: result.authorization_code,
        card_last_digits:   result.card_detail?.card_number,
        payment_type:       result.payment_type_code,
        status:             'approved',
      }).eq('id', payment.id)

      await supabaseAdmin.from('bookings').update({
        status:         'confirmed',
        payment_status: 'paid',
      }).eq('id', payment.booking_id)

      // Emails
      const { data: booking } = await supabaseAdmin
        .from('bookings')
        .select(`check_in, check_out, guests, total_price,
                 units(name), campings(name, owner_id),
                 profiles!traveler_id(full_name, email:profiles(email))`)
        .eq('id', payment.booking_id)
        .single()

      if (booking) {
        const b = booking as any
        await sendBookingConfirmedTraveler({
          to:         b.profiles?.email ?? '',
          name:       b.profiles?.full_name ?? 'Viajero',
          campingName: b.campings?.name,
          unitName:   b.units?.name,
          checkIn:    b.check_in,
          checkOut:   b.check_out,
          guests:     b.guests,
          total:      Number(b.total_price),
          bookingId:  payment.booking_id,
        }).catch(() => {})
      }

      return redirect(`/app/booking/success?id=${payment.booking_id}`)
    } else {
      // Pago rechazado
      await supabaseAdmin.from('payments').update({ status: 'rejected' }).eq('id', payment.id)
      await supabaseAdmin.from('bookings').update({ status: 'cancelled' }).eq('id', payment.booking_id)
      return redirect(`/app/booking/cancel?reason=rejected&code=${result.response_code}`)
    }
  } catch (err) {
    return redirect('/app/booking/cancel?reason=error')
  }
}
