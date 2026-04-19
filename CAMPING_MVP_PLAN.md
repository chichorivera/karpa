# CampingShare — Plan de Desarrollo MVP

> Clon funcional de AirBnB orientado exclusivamente a Campings. Marketplace multi-rol hospedado en Netlify (plan gratuito).

---

## Stack Tecnológico

| Capa | Tecnología | Plan gratuito |
|---|---|---|
| Frontend / SSR | Astro 4.x | — |
| Base de datos + Auth | Supabase | ✅ 500 MB / 50k MAU |
| Serverless functions | Netlify Functions (Astro SSR adapter) | ✅ 125k req/mes |
| Storage (imágenes) | Supabase Storage | ✅ 1 GB |
| Hosting | Netlify | ✅ |
| Pagos | Webpay Plus — Transbank API REST | — |
| Email transaccional | Resend | ✅ 3k emails/mes |
| Mapas | Leaflet + OpenStreetMap | ✅ gratuito |

---

## Identidad Visual y Design System

### Logo
- Archivos en `borrador/logo/`
- Variantes disponibles:
  - Color con fondo (uso general)
  - Color con fondo transparente
  - Blanco con fondo transparente (uso sobre fondos oscuros o fotografías)

### Paleta de Colores

| Nombre | Hex | Uso |
|---|---|---|
| Marrón Madera | `#6D4C3D` | Color primario, CTAs, headers |
| Verde Bosque | `#2E593F` | Color secundario, badges, éxito |
| Naranja Atardecer | `#F27C38` | Acento, destacados, precio |
| Arena Calor | `#F4E8D4` | Fondos claros, cards |
| Crema Tierra | `#D9C3A5` | Bordes, separadores, fondos secundarios |

```js
// tailwind.config.mjs — design tokens
colors: {
  madera:    '#6D4C3D',
  bosque:    '#2E593F',
  atardecer: '#F27C38',
  arena:     '#F4E8D4',
  crema:     '#D9C3A5',
}
```

### Tipografía sugerida
- **Headings:** Playfair Display (serifa, evoca naturaleza/calidez)
- **Body:** Inter o DM Sans (legibilidad en pantalla)
- Fuentes vía Google Fonts, cargadas con `font-display: swap`

### Estándar de Calidad de Diseño
El diseño debe ser **moderno, premium y de nivel world-class**, con el estándar del mejor diseñador UX/UI del mundo. Cada pantalla debe sentirse cuidada, con atención al detalle en espaciado, microinteracciones, jerarquía visual y coherencia. No se aceptan interfaces genéricas o de template.

### Principios de Diseño UX
- Mobile-first: la mayoría de viajeros buscan desde el celular
- Fotografía como protagonista: cards grandes con imagen de fondo
- Jerarquía clara: precio visible, fechas accesibles, CTA en color `atardecer`
- Formularios en un solo paso cuando sea posible (reducir fricción)
- Estados de carga: skeleton screens, nunca spinners sueltos
- Microinteracciones: hover, transiciones y animaciones sutiles en cada acción
- Espaciado generoso: respira, no se amontona
- Consistencia absoluta entre vistas y roles

---

## FASE -1 — Diseño UX/UI (Previo al desarrollo)

### Flujos de usuario a wireframear
- [ ] Flujo Viajero: Home → Búsqueda → Detalle camping → Selección unidad → Checkout Webpay → Confirmación
- [ ] Flujo Host: Registro → Crear camping (wizard) → Gestionar reservas → Calendario
- [ ] Flujo Admin: Dashboard → Moderar camping → Gestión usuarios

### Componentes del Design System a definir
- [ ] Navbar (pública / autenticada por rol)
- [ ] Card de camping (resultado de búsqueda)
- [ ] Card de unidad/parcela
- [ ] Buscador principal (hero y barra compacta)
- [ ] Calendario de disponibilidad
- [ ] Formulario de reserva + resumen de precio
- [ ] Pantalla de redirección a Webpay y confirmación de pago
- [ ] Badge de estado (reserva, camping)
- [ ] Modal de galería de fotos
- [ ] Sistema de reseñas (estrellas + comentario)

### Entregables antes de codear
- [ ] Wireframes mobile + desktop de las páginas críticas
- [ ] Design tokens definidos en Tailwind (colores, espaciado, sombras)
- [ ] Componentes Astro base: Button, Card, Input, Badge, Modal

---

## Roles del Sistema

```
Admin
 └── Gestión total de la plataforma, usuarios, campings y reservas

Admin Camping
 └── Gestiona uno o varios campings propios
 └── Crea/edita listings, disponibilidad, precios y reglas
 └── Acepta/rechaza reservas

Viajero (Cliente)
 └── Busca campings, reserva, paga y deja reseñas
```

---

## Estructura de Base de Datos (Supabase)

```sql
-- Usuarios (extiende auth.users de Supabase)
profiles          id, role, full_name, avatar_url, phone, created_at

-- Campings
campings          id, owner_id(→profiles), name, slug, description,
                  address, lat, lng, country, city,
                  status(draft|active|paused), created_at

-- Imágenes de camping
camping_images    id, camping_id, url, order, is_cover

-- Unidades / Parcelas (lo que se reserva)
units             id, camping_id, name, type(tent|camper|cabin|glamping),
                  capacity, price_per_night, amenities(jsonb),
                  status(active|inactive)

-- Disponibilidad bloqueada
blocked_dates     id, unit_id, date_from, date_to, reason

-- Reservas
bookings          id, unit_id, traveler_id, camping_id,
                  check_in, check_out, guests, total_price,
                  status(pending|confirmed|cancelled|completed),
                  payment_status(unpaid|paid|refunded),
                  created_at

-- Reseñas
reviews           id, booking_id, traveler_id, camping_id,
                  rating(1-5), comment, created_at

-- Mensajes (sistema básico)
messages          id, booking_id, sender_id, body, created_at
```

---

## Fases de Desarrollo

---

### FASE 0 — Setup del Proyecto (Día 1-2)

- [ ] Crear repositorio Git
- [ ] Inicializar proyecto Astro con adaptador Netlify SSR
  ```bash
  npm create astro@latest camping-share
  npx astro add netlify
  npx astro add tailwind
  ```
- [ ] Configurar Supabase: nuevo proyecto, copiar keys a `.env`
- [ ] Configurar variables de entorno en Netlify
- [ ] Deploy inicial vacío a Netlify (conectar repo)
- [ ] Definir design tokens (colores, tipografía) en Tailwind config
- [ ] Crear estructura de carpetas:
  ```
  src/
  ├── components/
  ├── layouts/
  ├── pages/
  │   ├── api/          ← Netlify Functions (Astro API routes)
  │   ├── admin/
  │   ├── host/         ← Admin Camping
  │   └── app/          ← Viajero
  ├── lib/
  │   ├── supabase.ts
  │   └── auth.ts
  └── middleware.ts      ← protección de rutas por rol
  ```

---

### FASE 1 — Autenticación y Gestión de Usuarios (Día 3-5)

- [ ] Integrar Supabase Auth (email + password)
- [ ] Registro con selección de rol: **Viajero** o **Admin Camping**
  - Los Admin son creados manualmente desde Supabase o panel admin
- [ ] Login / Logout
- [ ] Middleware Astro: proteger rutas según rol
  ```ts
  // middleware.ts
  // /admin/* → solo role='admin'
  // /host/*  → solo role='host'
  // /app/*   → solo role='traveler' o autenticado
  ```
- [ ] Página de perfil: editar nombre, avatar, teléfono
- [ ] Reset de contraseña por email (Supabase + Resend)
- [ ] RLS (Row Level Security) en Supabase para todas las tablas

---

### FASE 2 — Panel Admin Camping (Host) (Día 6-12)

#### 2.1 Gestión de Campings
- [ ] Crear nuevo camping (wizard multi-paso)
  1. Info básica: nombre, descripción, categoría
  2. Ubicación: dirección + mapa Leaflet para pin exacto
  3. Fotos: upload múltiple a Supabase Storage
  4. Publicar o guardar borrador
- [ ] Listar mis campings con estado (draft / active / paused)
- [ ] Editar camping existente
- [ ] Activar / pausar camping

#### 2.2 Gestión de Unidades / Parcelas
- [ ] Crear unidades dentro de un camping (tipo, capacidad, precio/noche)
- [ ] Definir amenities por unidad (checkbox: wifi, baño, electricidad, etc.)
- [ ] Activar / desactivar unidad

#### 2.3 Calendario y Disponibilidad
- [ ] Calendario visual por unidad
- [ ] Bloquear fechas manualmente (mantenimiento, uso propio)
- [ ] Ver reservas confirmadas en el calendario

#### 2.4 Gestión de Reservas (Host)
- [ ] Listado de reservas con filtros (estado, fecha, unidad)
- [ ] Detalle de reserva: datos del viajero, fechas, monto
- [ ] Confirmar / rechazar reserva (si se usa modo manual)
- [ ] Historial de reservas completadas

---

### FASE 3 — Búsqueda y Listados Públicos (Día 13-18)

- [ ] Página principal (`/`): hero, buscador, campings destacados
- [ ] Buscador con filtros:
  - Destino (ciudad / país)
  - Fechas check-in / check-out
  - Número de personas
  - Tipo de unidad (tienda, cabaña, glamping, etc.)
  - Precio máximo por noche
  - Amenities
- [ ] Página de resultados (`/search`) con:
  - Listado de campings/unidades disponibles
  - Mapa lateral con Leaflet (pins de cada resultado)
  - Paginación
- [ ] Página de detalle de camping (`/camping/[slug]`):
  - Galería de fotos
  - Descripción, ubicación, reglas
  - Listado de unidades disponibles con precios
  - Reseñas y rating promedio
  - Mapa con ubicación exacta
- [ ] SEO: meta tags dinámicos por camping (Astro `<head>`)

---

### FASE 4 — Reservas y Pagos con Webpay Plus (Día 19-25)

#### 4.1 Flujo de Reserva
- [ ] Selección de unidad + fechas → formulario de reserva
- [ ] Calcular precio total (noches × precio/noche + fees si aplica)
- [ ] Crear reserva con estado `pending_payment`
- [ ] Redirigir al checkout de Webpay Plus

#### 4.2 Integración Webpay Plus — Transbank API REST
```
Ambiente integración: https://webpay3g.transbank.cl  (sin costo)
Ambiente producción:  requiere contrato comercial con Transbank
```
- [ ] Instalar SDK oficial: `npm install transbank-sdk`
- [ ] Netlify Function: `POST /api/payments/create`
  - Crea transacción en Transbank con `amount`, `buyOrder`, `sessionId`, `returnUrl`
  - Retorna `url + token` → redirige al formulario de tarjeta de Transbank
- [ ] Netlify Function: `GET /api/payments/confirm`
  - Recibe `token_ws` en la `returnUrl`
  - Confirma la transacción con Transbank (`transaction.commit(token)`)
  - Verifica `responseCode === 0` (aprobado)
  - Actualiza reserva: `status = confirmed`, `payment_status = paid`
  - Guarda `tbk_transaction_id`, `authorization_code`, `card_last_digits`
- [ ] Página de éxito: resumen de reserva + código de autorización
- [ ] Página de error/rechazo: opciones de reintentar o contactar soporte
- [ ] Manejar caso `TBK_TOKEN` (usuario abandona el pago en Webpay)
- [ ] Email de confirmación de pago al viajero (Resend)
- [ ] Email de nueva reserva confirmada al host (Resend)

#### 4.3 Tabla adicional en BD
```sql
payments    id, booking_id, tbk_buy_order, tbk_session_id,
            tbk_transaction_id, authorization_code,
            amount, status(pending|approved|rejected|annulled),
            card_last_digits, payment_type, created_at
```

#### 4.4 Política de cancelación (MVP)
- [ ] Cancelación por el host → reembolso manual coordinado fuera de plataforma
- [ ] Cancelación por el viajero antes de check-in → flujo de anulación Webpay (Transbank API)
- [ ] Documentar política en página estática `/politica-cancelacion`

---

### FASE 5 — Panel del Viajero (Día 26-30)

- [ ] Dashboard: próximas reservas, reservas pasadas
- [ ] Detalle de reserva con estado actual
- [ ] Cancelar reserva (si está en `pending`)
- [ ] Sistema de mensajes básico con el host (por reserva)
- [ ] Dejar reseña al completar estancia
  - Rating 1-5 estrellas + comentario
  - Solo una reseña por reserva completada
- [ ] Historial de campings visitados

---

### FASE 6 — Panel Administrador (Día 31-35)

- [ ] Dashboard con métricas:
  - Total campings activos
  - Total reservas (por estado)
  - Nuevos usuarios (semana/mes)
- [ ] Gestión de usuarios: listar, cambiar rol, desactivar cuenta
- [ ] Moderación de campings: aprobar campings nuevos, suspender
- [ ] Moderación de reseñas: eliminar contenido inapropiado
- [ ] Ver todas las reservas con filtros avanzados

---

### FASE 7 — Polish y Lanzamiento (Día 36-40)

- [ ] Responsive design: mobile-first en todas las vistas
- [ ] Página de error 404 y 500
- [ ] Loading states y skeleton screens
- [ ] Optimización de imágenes (Astro Image + WebP)
- [ ] Lighthouse audit: apuntar a 90+ en performance
- [ ] Configurar dominio personalizado en Netlify
- [ ] Variables de entorno de producción revisadas
- [ ] Test de flujo completo: registro → camping → reserva → reseña
- [ ] Política de privacidad y términos de uso (páginas estáticas)

---

## Páginas del Proyecto

```
/                          → Home público
/search                    → Resultados de búsqueda
/camping/[slug]            → Detalle de camping
/auth/login                → Login
/auth/register             → Registro
/auth/reset-password       → Reset contraseña

/app/dashboard             → Dashboard viajero
/app/bookings              → Mis reservas
/app/bookings/[id]         → Detalle reserva
/app/profile               → Mi perfil

/host/dashboard            → Dashboard host
/host/campings             → Mis campings
/host/campings/new         → Crear camping
/host/campings/[id]        → Editar camping
/host/campings/[id]/units  → Gestión de unidades
/host/bookings             → Reservas recibidas
/host/calendar/[unitId]    → Calendario de unidad

/admin/dashboard           → Panel admin
/admin/users               → Gestión de usuarios
/admin/campings            → Moderación de campings
/admin/bookings            → Todas las reservas
/admin/reviews             → Moderación de reseñas
```

---

## Configuración Netlify (netlify.toml)

```toml
[build]
  command = "npm run build"
  publish = "dist"

[build.environment]
  NODE_VERSION = "20"

[[redirects]]
  from = "/*"
  to = "/.netlify/functions/entry"
  status = 200
```

---

## Variables de Entorno Requeridas

```env
PUBLIC_SUPABASE_URL=
PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
RESEND_API_KEY=
TBK_COMMERCE_CODE=          # Código de comercio Transbank
TBK_API_KEY=                # API Key Transbank
TBK_ENVIRONMENT=            # integration | production
PUBLIC_BASE_URL=            # URL base del sitio (para returnUrl de Webpay)
```

---

## Limitaciones del Plan Gratuito a Tener en Cuenta

| Servicio | Límite gratuito | Riesgo |
|---|---|---|
| Netlify Functions | 125k invocaciones/mes | Monitorear en producción |
| Netlify Build | 300 min/mes | Optimizar build time |
| Supabase DB | 500 MB | Comprimir imágenes antes de subir |
| Supabase Storage | 1 GB | Limitar fotos por camping (máx 10) |
| Supabase Auth | 50k MAU | Suficiente para MVP |
| Resend | 3k emails/mes | Solo emails críticos |

---

## Estimación de Tiempo Total

| Fase | Días estimados |
|---|---|
| -1 — Diseño UX/UI | 5 |
| 0 — Setup | 2 |
| 1 — Auth | 3 |
| 2 — Panel Host | 7 |
| 3 — Búsqueda pública | 6 |
| 4 — Reservas + Webpay | 8 |
| 5 — Panel Viajero | 5 |
| 6 — Panel Admin | 5 |
| 7 — Polish + Deploy | 5 |
| **Total** | **~46 días** |

---

## Próximos Pasos Inmediatos

1. Confirmar nombre del proyecto y dominio
2. Crear cuenta Supabase y proyecto
3. Crear cuenta Netlify y conectar repositorio
4. Inicializar proyecto Astro y hacer primer deploy
5. Comenzar Fase 1 (Auth)
