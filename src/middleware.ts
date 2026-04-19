import { defineMiddleware } from 'astro:middleware'
import { getSessionUser } from './lib/supabase'

const ROLE_ROUTES: Record<string, string> = {
  '/admin': 'admin',
  '/host':  'host',
  '/app':   'traveler',
}

export const onRequest = defineMiddleware(async (context, next) => {
  const { pathname } = context.url

  const requiredRole = Object.entries(ROLE_ROUTES).find(([prefix]) =>
    pathname.startsWith(prefix)
  )?.[1]

  if (!requiredRole) return next()

  const { user, profile } = await getSessionUser(context.cookies)

  if (!user) return context.redirect(`/auth/login?next=${encodeURIComponent(pathname)}`)

  // Viajeros pueden acceder a rutas /app aunque el role sea host o admin
  if (requiredRole === 'traveler') {
    return next()
  }

  if (profile?.role !== requiredRole) {
    return context.redirect('/')
  }

  return next()
})
