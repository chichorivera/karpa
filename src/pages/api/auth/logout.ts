import type { APIRoute } from 'astro'
import { supabase } from '../../../lib/supabase'

export const POST: APIRoute = async () => {
  await supabase.auth.signOut()
  return new Response(null, {
    status: 302,
    headers: {
      Location: '/auth/login',
      'Set-Cookie': 'sb-access-token=; Path=/; Max-Age=0; HttpOnly',
    },
  })
}
