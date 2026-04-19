import { Resend } from 'resend'

const resend = new Resend(import.meta.env.RESEND_API_KEY)
const FROM   = 'Karpa <onboarding@resend.dev>'
const BASE   = import.meta.env.PUBLIC_BASE_URL

export async function sendBookingConfirmedTraveler(opts: {
  to: string; name: string; campingName: string; unitName: string
  checkIn: string; checkOut: string; guests: number; total: number; bookingId: string
}) {
  await resend.emails.send({
    from: FROM, to: opts.to,
    subject: `✅ Reserva confirmada — ${opts.campingName}`,
    html: `
      <h2>¡Tu reserva está confirmada!</h2>
      <p>Hola ${opts.name}, tu pago fue procesado exitosamente.</p>
      <ul>
        <li><strong>Camping:</strong> ${opts.campingName}</li>
        <li><strong>Parcela:</strong> ${opts.unitName}</li>
        <li><strong>Check-in:</strong> ${opts.checkIn}</li>
        <li><strong>Check-out:</strong> ${opts.checkOut}</li>
        <li><strong>Huéspedes:</strong> ${opts.guests}</li>
        <li><strong>Total pagado:</strong> $${opts.total.toLocaleString('es-CL')}</li>
      </ul>
      <p><a href="${BASE}/app/bookings/${opts.bookingId}">Ver detalle de tu reserva →</a></p>
    `,
  })
}

export async function sendBookingNotificationHost(opts: {
  to: string; hostName: string; travelerName: string; campingName: string
  unitName: string; checkIn: string; checkOut: string; total: number; bookingId: string
}) {
  await resend.emails.send({
    from: FROM, to: opts.to,
    subject: `🏕️ Nueva reserva — ${opts.campingName}`,
    html: `
      <h2>Tienes una nueva reserva</h2>
      <p>Hola ${opts.hostName},</p>
      <p><strong>${opts.travelerName}</strong> ha reservado en tu camping.</p>
      <ul>
        <li><strong>Camping:</strong> ${opts.campingName}</li>
        <li><strong>Parcela:</strong> ${opts.unitName}</li>
        <li><strong>Check-in:</strong> ${opts.checkIn}</li>
        <li><strong>Check-out:</strong> ${opts.checkOut}</li>
        <li><strong>Total:</strong> $${opts.total.toLocaleString('es-CL')}</li>
      </ul>
      <p><a href="${BASE}/host/bookings">Ver en tu panel →</a></p>
    `,
  })
}
