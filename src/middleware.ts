import { defineMiddleware } from 'astro:middleware'
import { createClient } from '@supabase/supabase-js'

const ROLE_ROUTES: Record<string, string[]> = {
  admin:    ['/admin'],
  host:     ['/host'],
  traveler: ['/app'],
}

export const onRequest = defineMiddleware(async (context, next) => {
  const { pathname } = context.url

  const protectedPrefix = Object.values(ROLE_ROUTES).flat().find(p => pathname.startsWith(p))
  if (!protectedPrefix) return next()

  const supabase = createClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
  )

  const authHeader = context.request.headers.get('cookie') ?? ''
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return context.redirect('/auth/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const role = profile?.role as string
  const allowedPrefix = ROLE_ROUTES[role] ?? []

  if (!allowedPrefix.some(p => pathname.startsWith(p))) {
    return context.redirect('/')
  }

  return next()
})
