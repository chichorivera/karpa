import type { APIRoute } from 'astro'
import { createSupabaseServerClient } from '../../../lib/supabase'

export const POST: APIRoute = async ({ cookies, redirect }) => {
  const client = createSupabaseServerClient(cookies)
  await client.auth.signOut()
  return redirect('/auth/login')
}
