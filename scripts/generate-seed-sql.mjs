// Karpa — Genera SQL de seed para ejecutar en Supabase SQL Editor
// Ejecutar: node scripts/generate-seed-sql.mjs > scripts/seed-data.sql

const PASSWORD_HASH = '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6' // 1q2w3e4r

// ─── UTILS ───────────────────────────────────────────────────────────────────

function uuid(seed) {
  // Deterministic-ish UUID from seed index
  const hex = seed.toString(16).padStart(8, '0')
  return `${hex}-0000-4000-8000-000000000000`
}

function slugify(text) {
  return text.toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s-]/g, '')
    .trim().replace(/\s+/g, '-')
}

function sq(s) {
  return `'${String(s).replace(/'/g, "''")}'`
}

function jq(obj) {
  return sq(JSON.stringify(obj))
}

// ─── USUARIOS ────────────────────────────────────────────────────────────────

const USERS = [
  { idx: 1,  email: 'admin@karpa.cl',             full_name: 'Administrador Karpa', role: 'admin'    },
  { idx: 2,  email: 'carlos.mendoza@karpa.cl',    full_name: 'Carlos Mendoza',      role: 'host'     },
  { idx: 3,  email: 'maria.gonzalez@karpa.cl',    full_name: 'María González',      role: 'host'     },
  { idx: 4,  email: 'pedro.rojas@karpa.cl',       full_name: 'Pedro Rojas',         role: 'host'     },
  { idx: 5,  email: 'ana.martinez@karpa.cl',      full_name: 'Ana Martínez',        role: 'host'     },
  { idx: 6,  email: 'luis.fernandez@karpa.cl',    full_name: 'Luis Fernández',      role: 'host'     },
  { idx: 7,  email: 'carmen.lopez@karpa.cl',      full_name: 'Carmen López',        role: 'host'     },
  { idx: 8,  email: 'jorge.sanchez@karpa.cl',     full_name: 'Jorge Sánchez',       role: 'host'     },
  { idx: 9,  email: 'valentina.torres@karpa.cl',  full_name: 'Valentina Torres',    role: 'host'     },
  { idx: 10, email: 'roberto.diaz@karpa.cl',      full_name: 'Roberto Díaz',        role: 'host'     },
  { idx: 11, email: 'sofia.munoz@karpa.cl',       full_name: 'Sofía Muñoz',         role: 'host'     },
  { idx: 12, email: 'viajero1@karpa.cl',          full_name: 'Juan Pérez',          role: 'traveler' },
  { idx: 13, email: 'viajero2@karpa.cl',          full_name: 'Claudia Ramos',       role: 'traveler' },
  { idx: 14, email: 'viajero3@karpa.cl',          full_name: 'Matías Herrera',      role: 'traveler' },
]

const HOSTS = USERS.filter(u => u.role === 'host')

// ─── LOCACIONES ──────────────────────────────────────────────────────────────

const LOCS = [
  { city: 'Pucón',               lat: -39.2724, lng: -71.9767 },
  { city: 'Puerto Varas',        lat: -41.3197, lng: -72.9870 },
  { city: 'San José de Maipo',   lat: -33.6404, lng: -70.3528 },
  { city: 'Cajón del Maipo',     lat: -33.7833, lng: -70.0833 },
  { city: 'Puerto Natales',      lat: -51.7333, lng: -72.5000 },
  { city: 'San Pedro de Atacama',lat: -22.9087, lng: -68.1997 },
  { city: 'Villarrica',          lat: -39.2817, lng: -72.2311 },
  { city: 'Ancud',               lat: -41.8700, lng: -73.8300 },
  { city: 'Maitencillo',         lat: -32.6500, lng: -71.4833 },
  { city: 'Curacautín',          lat: -38.4333, lng: -71.8833 },
  { city: 'Cochrane',            lat: -47.2500, lng: -72.5833 },
  { city: 'La Serena',           lat: -29.9027, lng: -71.2519 },
  { city: 'Termas de Chillán',   lat: -36.9083, lng: -71.4333 },
  { city: 'Frutillar',           lat: -41.1297, lng: -73.0556 },
  { city: 'Torres del Paine',    lat: -51.0000, lng: -73.0000 },
  { city: 'Olmué',               lat: -33.0000, lng: -71.1833 },
  { city: 'Santa Cruz',          lat: -34.6357, lng: -71.3636 },
  { city: 'Constitución',        lat: -35.3333, lng: -72.4167 },
  { city: 'Zapallar',            lat: -32.5546, lng: -71.4596 },
  { city: 'Lago Ranco',          lat: -40.2500, lng: -72.5833 },
  { city: 'Coyhaique',           lat: -45.5752, lng: -72.0662 },
  { city: 'Vichuquén',           lat: -34.8500, lng: -72.0167 },
  { city: 'Tongoy',              lat: -30.2583, lng: -71.4944 },
  { city: 'Caburgua',            lat: -39.1667, lng: -71.7833 },
  { city: 'Peñuelas',            lat: -32.9500, lng: -71.2167 },
  { city: 'Futaleufú',           lat: -43.1833, lng: -71.8667 },
  { city: 'Licán Ray',           lat: -39.5167, lng: -72.1500 },
  { city: 'Matanzas',            lat: -34.0000, lng: -71.8667 },
  { city: 'Chaitén',             lat: -42.9167, lng: -72.7167 },
  { city: 'Río Hurtado',         lat: -30.4500, lng: -70.8167 },
]

// ─── DATOS POR TIPO ───────────────────────────────────────────────────────────

function campingData(type, i, loc) {
  const prefixes = {
    tent:     ['Orilla del Río','Bosque Nativo','Vista al Volcán','Playa Escondida','Laguna Azul','Montaña Viva','Valle Verde','Río Cristal','Cerro Alegre','El Refugio',
               'Sendero del Viento','Noche Estrellada','Rincón Tranquilo','El Manantial','Praderas del Sur','Quebrada Verde','Alto del Cielo','Punta del Lago','Los Canelos','El Sauce',
               'Aguada Clara','Horizonte Sur','Paso del Indio','Camino de Sombra','Orillas del Laja','El Remanso','Siete Lagos','La Junta','Piedra del Águila','Arroyo Frío'],
    cabin:    ['Los Pinos','Lago Azul','Del Bosque','El Rancho','Patagonia','Las Araucarias','Vista Mar','Montaña Mágica','Quilanto','Piedra Roja',
               'Las Lengas','El Arrayán','Tres Ríos','La Hacienda','Bosque Encantado','Piedra del Sol','La Roca','Cielos Abiertos','El Mirador','Valle de Niebla',
               'Las Quinchas','Raíces del Sur','La Cascada','Ruca del Bosque','La Guarida','El Alerce','Viento Norte','Nido de Cóndor','Alto Villarrica','Sendero Rojo'],
    glamping: ['Estrellas','Safari','Cúpula del Cielo','Jardín Secreto','Árbol Eterno','Burbujas','Nido de Águila','Tierra Viva','Las Nubes','El Oasis',
               'Refugio Lunar','Domo Austral','El Pabellón','Nube Blanca','Las Esferas','Horizonte Mágico','El Santuario','La Capsula','Éter','Cosmos',
               'Aurora','Bruma','Silencio Vivo','El Portal','Umbral Verde','Nido Estelar','La Ensoñación','Éxtasis Natural','El Origen','Tierra Alta'],
    camper:   ['Ruta Sur','Camino Austral','Costa Libre','Las Terrazas','Paso de Montaña','Ruta del Vino','Norte Grande','Lago Sur','Valle Central','Punta Extremo',
               'Km 0 Sur','Gasolinera Verde','Área de Descanso','El Poste','Cruce del Viento','La Bifurcación','Llave del Sur','Inicio Patagonia','Punto Rojo','Escala Austral',
               'Ruta Costera','Freno en Curva','Mirador del Asfalto','Las Señales','El Tapón','Velocidad Cero','El Crucero','Brújula Sur','Carpa Rodante','Motor Apagado'],
  }
  const descs = {
    tent:     'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.',
    cabin:    'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.',
    glamping: 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.',
    camper:   'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.',
  }
  const rules = {
    tent:     'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.',
    cabin:    'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.',
    glamping: 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.',
    camper:   'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.',
  }
  const amenitiesMap = {
    tent:     ['Fogón','Agua potable','Baños compartidos','Duchas','Estacionamiento','WiFi recepción'],
    cabin:    ['Cocina equipada','Calefacción','WiFi','Ropa de cama','Estacionamiento','Smart TV'],
    glamping: ['Cama king','Desayuno incluido','WiFi','Calefacción','Baño privado','Servicio butlería'],
    camper:   ['Electricidad 220V','Agua potable','Descarga grises','Baños','Duchas calientes','WiFi'],
  }
  const priceMins = { tent: 8000,  cabin: 45000, glamping: 80000,  camper: 15000 }
  const priceMaxs = { tent: 25000, cabin: 120000, glamping: 250000, camper: 40000 }
  const caps      = { tent: 4,     cabin: 6,     glamping: 2,      camper: 4 }
  const unitNames = { tent: 'Parcela', cabin: 'Cabaña', glamping: 'Domo Premium', camper: 'Sitio Camper' }

  const suffix = prefixes[type][i % prefixes[type].length]
  const name   = `Camping ${suffix} ${loc.city}`
  const slug   = `${slugify(name)}-${type}-${i + 1}`
  const jitter = (v, r) => +(v + (((i * 7 + 3) % 100) / 100 - 0.5) * r).toFixed(7)
  const price  = Math.round((priceMins[type] + ((i * 13) % (priceMaxs[type] - priceMins[type]))) / 1000) * 1000

  return {
    name, slug,
    desc:      descs[type],
    address:   `Sector ${suffix}, camino s/n`,
    city:      loc.city,
    lat:       jitter(loc.lat, 0.05),
    lng:       jitter(loc.lng, 0.05),
    rules:     rules[type],
    amenities: amenitiesMap[type],
    price,
    capacity:  caps[type],
    unitName:  `${unitNames[type]} ${suffix}`,
  }
}

// ─── GENERAR SQL ──────────────────────────────────────────────────────────────

const lines = []

lines.push(`-- ================================================================`)
lines.push(`-- KARPA — Seed masivo`)
lines.push(`-- Contraseña de todos los usuarios: 1q2w3e4r`)
lines.push(`-- Ejecutar en Supabase SQL Editor`)
lines.push(`-- ================================================================`)
lines.push(``)
lines.push(`DO $$`)
lines.push(`DECLARE`)
lines.push(`  v_uid uuid;`)
lines.push(`  v_cid uuid;`)
lines.push(`BEGIN`)
lines.push(``)

// Create auth users
lines.push(`-- ── USUARIOS ──────────────────────────────────────────────────────`)
for (const u of USERS) {
  const uid = uuid(u.idx)
  lines.push(`-- ${u.full_name} (${u.role})`)
  lines.push(`INSERT INTO auth.users (`)
  lines.push(`  instance_id, id, aud, role, email, encrypted_password,`)
  lines.push(`  email_confirmed_at, created_at, updated_at,`)
  lines.push(`  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user`)
  lines.push(`) VALUES (`)
  lines.push(`  '00000000-0000-0000-0000-000000000000',`)
  lines.push(`  '${uid}',`)
  lines.push(`  'authenticated', 'authenticated',`)
  lines.push(`  ${sq(u.email)},`)
  lines.push(`  ${sq(PASSWORD_HASH)},`)
  lines.push(`  now(), now(), now(),`)
  lines.push(`  ${jq({ provider: 'email', providers: ['email'] })},`)
  lines.push(`  ${jq({ full_name: u.full_name })},`)
  lines.push(`  false, false`)
  lines.push(`) ON CONFLICT (id) DO NOTHING;`)
  lines.push(``)
  lines.push(`INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)`)
  lines.push(`VALUES (`)
  lines.push(`  gen_random_uuid(), ${sq(uid)}, '${uid}',`)
  lines.push(`  ${jq({ sub: uid, email: u.email })},`)
  lines.push(`  'email', now(), now(), now()`)
  lines.push(`) ON CONFLICT DO NOTHING;`)
  lines.push(``)
}


// Create profiles
lines.push(`-- ── PROFILES ──────────────────────────────────────────────────────`)
for (const u of USERS) {
  const uid = uuid(u.idx)
  lines.push(`INSERT INTO public.profiles (id, full_name, role)`)
  lines.push(`VALUES ('${uid}', ${sq(u.full_name)}, '${u.role}')`)
  lines.push(`ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;`)
  lines.push(``)
}

// Create campings — 30 per type
lines.push(`-- ── CAMPINGS ──────────────────────────────────────────────────────`)
let imgSeed = 200
let campIdx = 1

for (const type of ['tent', 'cabin', 'glamping', 'camper']) {
  lines.push(`-- Tipo: ${type}`)
  for (let i = 0; i < 30; i++) {
    const host = HOSTS[i % HOSTS.length]
    const loc  = LOCS[i % LOCS.length]
    const d    = campingData(type, i, loc)
    const cuid = uuid(1000 + campIdx)
    const uid  = uuid(host.idx)

    lines.push(`v_cid := '${cuid}';`)
    lines.push(`INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)`)
    lines.push(`VALUES (v_cid, '${uid}', ${sq(d.name)}, ${sq(d.slug)}, ${sq(d.desc)}, ${sq(d.address)}, ${sq(d.city)}, 'Chile', ${d.lat}, ${d.lng}, ${sq(d.rules)}, 'active')`)
    lines.push(`ON CONFLICT (slug) DO NOTHING;`)
    lines.push(``)

    // 5 images
    for (let p = 0; p < 5; p++) {
      lines.push(`INSERT INTO public.camping_images (camping_id, url, "order", is_cover)`)
      lines.push(`VALUES (v_cid, 'https://picsum.photos/seed/${imgSeed}/800/600', ${p}, ${p === 0 ? 'true' : 'false'});`)
      imgSeed++
    }
    lines.push(``)

    // 2 units
    lines.push(`INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)`)
    lines.push(`VALUES (v_cid, ${sq(d.unitName + ' 1')}, '${type}', ${d.capacity}, ${d.price}, ${sq(JSON.stringify(d.amenities.slice(0, 4)))}, 'Unidad principal con todas las comodidades.', 'active');`)
    lines.push(`INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)`)
    lines.push(`VALUES (v_cid, ${sq(d.unitName + ' 2')}, '${type}', ${d.capacity}, ${Math.round(d.price * 0.9 / 1000) * 1000}, ${sq(JSON.stringify(d.amenities.slice(0, 3)))}, 'Segunda unidad disponible.', 'active');`)
    lines.push(``)

    campIdx++
  }
}

lines.push(`END $$;`)
lines.push(``)
lines.push(`-- Verificar`)
lines.push(`SELECT count(*) AS campings FROM public.campings;`)
lines.push(`SELECT count(*) AS usuarios FROM public.profiles;`)
lines.push(`SELECT count(*) AS unidades FROM public.units;`)

console.log(lines.join('\n'))
