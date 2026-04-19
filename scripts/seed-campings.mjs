// Re-seedea campings, unidades e imágenes usando los host IDs actuales
// node scripts/seed-campings.mjs

import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://wfzmkmzghccaemcghquv.supabase.co'
const SERVICE_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indmem1rbXpnaGNjYWVtY2docXV2Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NjU2MjY1OSwiZXhwIjoyMDkyMTM4NjU5fQ.UBcRrN0-NY3gokSbwozllNKMTmOPTBMgE0kZm2id2fo'

const sb = createClient(SUPABASE_URL, SERVICE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false }
})

// ─── LOCACIONES ──────────────────────────────────────────────────────────────

const LOCS = [
  { city: 'Pucón',                lat: -39.2724, lng: -71.9767 },
  { city: 'Puerto Varas',         lat: -41.3197, lng: -72.9870 },
  { city: 'San José de Maipo',    lat: -33.6404, lng: -70.3528 },
  { city: 'Cajón del Maipo',      lat: -33.7833, lng: -70.0833 },
  { city: 'Puerto Natales',       lat: -51.7333, lng: -72.5000 },
  { city: 'San Pedro de Atacama', lat: -22.9087, lng: -68.1997 },
  { city: 'Villarrica',           lat: -39.2817, lng: -72.2311 },
  { city: 'Ancud',                lat: -41.8700, lng: -73.8300 },
  { city: 'Maitencillo',          lat: -32.6500, lng: -71.4833 },
  { city: 'Curacautín',           lat: -38.4333, lng: -71.8833 },
  { city: 'Cochrane',             lat: -47.2500, lng: -72.5833 },
  { city: 'La Serena',            lat: -29.9027, lng: -71.2519 },
  { city: 'Termas de Chillán',    lat: -36.9083, lng: -71.4333 },
  { city: 'Frutillar',            lat: -41.1297, lng: -73.0556 },
  { city: 'Torres del Paine',     lat: -51.0000, lng: -73.0000 },
  { city: 'Olmué',                lat: -33.0000, lng: -71.1833 },
  { city: 'Santa Cruz',           lat: -34.6357, lng: -71.3636 },
  { city: 'Constitución',         lat: -35.3333, lng: -72.4167 },
  { city: 'Zapallar',             lat: -32.5546, lng: -71.4596 },
  { city: 'Lago Ranco',           lat: -40.2500, lng: -72.5833 },
  { city: 'Coyhaique',            lat: -45.5752, lng: -72.0662 },
  { city: 'Vichuquén',            lat: -34.8500, lng: -72.0167 },
  { city: 'Tongoy',               lat: -30.2583, lng: -71.4944 },
  { city: 'Caburgua',             lat: -39.1667, lng: -71.7833 },
  { city: 'Peñuelas',             lat: -32.9500, lng: -71.2167 },
  { city: 'Futaleufú',            lat: -43.1833, lng: -71.8667 },
  { city: 'Licán Ray',            lat: -39.5167, lng: -72.1500 },
  { city: 'Matanzas',             lat: -34.0000, lng: -71.8667 },
  { city: 'Chaitén',              lat: -42.9167, lng: -72.7167 },
  { city: 'Río Hurtado',          lat: -30.4500, lng: -70.8167 },
]

const TYPES = [
  {
    type: 'tent', label: 'Carpas', priceMin: 8000, priceMax: 25000,
    names: ['Orilla del Río','Bosque Nativo','Vista al Volcán','Playa Escondida','Laguna Azul','Montaña Viva','Valle Verde','Río Cristal','Cerro Alegre','El Refugio','Sendero del Viento','Noche Estrellada','Rincón Tranquilo','El Manantial','Praderas del Sur','Quebrada Verde','Alto del Cielo','Punta del Lago','Los Canelos','El Sauce','Aguada Clara','Horizonte Sur','Paso del Indio','Camino de Sombra','Orillas del Laja','El Remanso','Siete Lagos','La Junta','Piedra del Águila','Arroyo Frío'],
    desc: 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.',
    rules: 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.',
    amenities: ['Fogón','Agua potable','Baños compartidos','Duchas','Estacionamiento','WiFi recepción'],
    unitName: 'Parcela', capacity: 4,
  },
  {
    type: 'cabin', label: 'Cabañas', priceMin: 45000, priceMax: 120000,
    names: ['Los Pinos','Lago Azul','Del Bosque','El Rancho','Patagonia','Las Araucarias','Vista Mar','Montaña Mágica','Quilanto','Piedra Roja','Las Lengas','El Arrayán','Tres Ríos','La Hacienda','Bosque Encantado','Piedra del Sol','La Roca','Cielos Abiertos','El Mirador','Valle de Niebla','Las Quinchas','Raíces del Sur','La Cascada','Ruca del Bosque','La Guarida','El Alerce','Viento Norte','Nido de Cóndor','Alto Villarrica','Sendero Rojo'],
    desc: 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.',
    rules: 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.',
    amenities: ['Cocina equipada','Calefacción','WiFi','Ropa de cama','Estacionamiento','Smart TV'],
    unitName: 'Cabaña', capacity: 6,
  },
  {
    type: 'glamping', label: 'Glamping', priceMin: 80000, priceMax: 250000,
    names: ['Estrellas','Safari','Cúpula del Cielo','Jardín Secreto','Árbol Eterno','Burbujas','Nido de Águila','Tierra Viva','Las Nubes','El Oasis','Refugio Lunar','Domo Austral','El Pabellón','Nube Blanca','Las Esferas','Horizonte Mágico','El Santuario','La Capsula','Éter','Cosmos','Aurora','Bruma','Silencio Vivo','El Portal','Umbral Verde','Nido Estelar','La Ensoñación','Éxtasis Natural','El Origen','Tierra Alta'],
    desc: 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.',
    rules: 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.',
    amenities: ['Cama king','Desayuno incluido','WiFi','Calefacción','Baño privado','Servicio butlería'],
    unitName: 'Domo Premium', capacity: 2,
  },
  {
    type: 'camper', label: 'Camper', priceMin: 15000, priceMax: 40000,
    names: ['Ruta Sur','Camino Austral','Costa Libre','Las Terrazas','Paso de Montaña','Ruta del Vino','Norte Grande','Lago Sur','Valle Central','Punta Extremo','Km 0 Sur','Gasolinera Verde','Área de Descanso','El Poste','Cruce del Viento','La Bifurcación','Llave del Sur','Inicio Patagonia','Punto Rojo','Escala Austral','Ruta Costera','Freno en Curva','Mirador del Asfalto','Las Señales','El Tapón','Velocidad Cero','El Crucero','Brújula Sur','Carpa Rodante','Motor Apagado'],
    desc: 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.',
    rules: 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.',
    amenities: ['Electricidad 220V','Agua potable','Descarga grises','Baños','Duchas calientes','WiFi'],
    unitName: 'Sitio Camper', capacity: 4,
  },
]

function slugify(text) {
  return text.toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s-]/g, '').trim().replace(/\s+/g, '-')
}

function sleep(ms) { return new Promise(r => setTimeout(r, ms)) }

async function main() {
  // Obtener hosts reales desde profiles
  const { data: hosts, error: hErr } = await sb
    .from('profiles').select('id, full_name').eq('role', 'host')
  if (hErr || !hosts?.length) {
    console.error('No se encontraron hosts:', hErr?.message); process.exit(1)
  }
  console.log(`🏕️  Hosts encontrados: ${hosts.length}`)
  hosts.forEach(h => console.log(`   ${h.full_name} — ${h.id}`))

  let totalCampings = 0
  let totalUnits    = 0
  let imgSeed       = 200

  for (const t of TYPES) {
    console.log(`\n── ${t.label} (30) ────────────────────`)

    for (let i = 0; i < 30; i++) {
      const host = hosts[i % hosts.length]
      const loc  = LOCS[i % LOCS.length]
      const name = `Camping ${t.names[i]} ${loc.city}`
      const slug = `${slugify(name)}-${t.type}-${i + 1}`
      const lat  = +(loc.lat + ((i * 7 % 100) / 100 - 0.5) * 0.05).toFixed(7)
      const lng  = +(loc.lng + ((i * 7 % 100) / 100 - 0.5) * 0.05).toFixed(7)
      const price = Math.round((t.priceMin + (i * 13 % (t.priceMax - t.priceMin))) / 1000) * 1000

      // Camping
      const { data: camping, error: cErr } = await sb.from('campings').insert({
        owner_id:    host.id,
        name, slug,
        description: t.desc,
        address:     `Sector ${t.names[i]}, camino s/n`,
        city:        loc.city,
        country:     'Chile',
        lat, lng,
        rules:       t.rules,
        status:      'active',
      }).select('id').single()

      if (cErr) {
        console.log(`  ✗ ${name}: ${cErr.message}`)
        continue
      }

      totalCampings++
      const cid = camping.id

      // 5 imágenes
      const imgs = Array.from({ length: 5 }, (_, p) => ({
        camping_id: cid,
        url:        `https://picsum.photos/seed/${imgSeed++}/800/600`,
        order:      p,
        is_cover:   p === 0,
      }))
      await sb.from('camping_images').insert(imgs)

      // 2 unidades
      await sb.from('units').insert([
        { camping_id: cid, name: `${t.unitName} ${t.names[i]} 1`, type: t.type, capacity: t.capacity, price_per_night: price,                                   amenities: JSON.stringify(t.amenities.slice(0,4)), description: 'Unidad principal.', status: 'active' },
        { camping_id: cid, name: `${t.unitName} ${t.names[i]} 2`, type: t.type, capacity: t.capacity, price_per_night: Math.round(price * 0.9 / 1000) * 1000,   amenities: JSON.stringify(t.amenities.slice(0,3)), description: 'Segunda unidad.',   status: 'active' },
      ])
      totalUnits += 2

      process.stdout.write(`  ✓ [${t.type}] ${name}\n`)
      await sleep(60)
    }
  }

  console.log(`\n✅ Seed completo`)
  console.log(`   Campings : ${totalCampings}`)
  console.log(`   Unidades : ${totalUnits}`)
  console.log(`   Imágenes : ${totalCampings * 5}`)
}

main().catch(e => { console.error(e); process.exit(1) })
