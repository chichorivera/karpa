import { createClient } from '@supabase/supabase-js'
import { createServerClient } from '@supabase/ssr'
import type { AstroCookies } from 'astro'

// Cliente admin sin cookies (server-only, service role)
export const supabaseAdmin = createClient(
  import.meta.env.PUBLIC_SUPABASE_URL,
  import.meta.env.SUPABASE_SERVICE_ROLE_KEY,
)

// Cliente público sin cookies (solo lectura pública, sin sesión)
export const supabase = createClient(
  import.meta.env.PUBLIC_SUPABASE_URL,
  import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
)

// Cliente SSR con cookies — usar en middleware y páginas protegidas
export function createSupabaseServerClient(cookies: AstroCookies) {
  return createServerClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
    {
      cookies: {
        get: (key)           => cookies.get(key)?.value,
        set: (key, val, opt) => cookies.set(key, val, opt as any),
        remove: (key, opt)   => cookies.delete(key, opt as any),
      },
    },
  )
}

// Helper: obtener usuario y perfil desde la sesión
export async function getSessionUser(cookies: AstroCookies) {
  const client = createSupabaseServerClient(cookies)
  const { data: { user } } = await client.auth.getUser()
  if (!user) return { user: null, profile: null, client }

  const { data: profile } = await client
    .from('profiles')
    .select('id, role, full_name, avatar_url, phone')
    .eq('id', user.id)
    .single()

  return { user, profile, client }
}
