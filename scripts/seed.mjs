// Karpa — Seed masivo: 1 admin + 10 hosts + 120 campings (30 por tipo)
// Ejecutar: node scripts/seed.mjs

import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = 'https://wfzmkmzghccaemcghquv.supabase.co'
const SERVICE_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indmem1rbXpnaGNjYWVtY2docXV2Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NjU2MjY1OSwiZXhwIjoyMDkyMTM4NjU5fQ.UBcRrN0-NY3gokSbwozllNKMTmOPTBMgE0kZm2id2fo'
const PASSWORD     = '1q2w3e4r'

const admin = createClient(SUPABASE_URL, SERVICE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false }
})

// ─── USUARIOS ────────────────────────────────────────────────────────────────

const ADMIN_USER = { email: 'admin@karpa.cl', full_name: 'Administrador Karpa', role: 'admin' }

const HOSTS = [
  { email: 'carlos.mendoza@karpa.cl',   full_name: 'Carlos Mendoza',    role: 'host' },
  { email: 'maria.gonzalez@karpa.cl',   full_name: 'María González',    role: 'host' },
  { email: 'pedro.rojas@karpa.cl',      full_name: 'Pedro Rojas',       role: 'host' },
  { email: 'ana.martinez@karpa.cl',     full_name: 'Ana Martínez',      role: 'host' },
  { email: 'luis.fernandez@karpa.cl',   full_name: 'Luis Fernández',    role: 'host' },
  { email: 'carmen.lopez@karpa.cl',     full_name: 'Carmen López',      role: 'host' },
  { email: 'jorge.sanchez@karpa.cl',    full_name: 'Jorge Sánchez',     role: 'host' },
  { email: 'valentina.torres@karpa.cl', full_name: 'Valentina Torres',  role: 'host' },
  { email: 'roberto.diaz@karpa.cl',     full_name: 'Roberto Díaz',      role: 'host' },
  { email: 'sofia.munoz@karpa.cl',      full_name: 'Sofía Muñoz',       role: 'host' },
]

// ─── UBICACIONES CHILE ────────────────────────────────────────────────────────

const LOCATIONS = [
  { city: 'Pucón',              region: 'Araucanía',   lat: -39.2724, lng: -71.9767 },
  { city: 'Puerto Varas',       region: 'Los Lagos',   lat: -41.3197, lng: -72.9870 },
  { city: 'San José de Maipo',  region: 'RM',          lat: -33.6404, lng: -70.3528 },
  { city: 'Cajón del Maipo',    region: 'RM',          lat: -33.7833, lng: -70.0833 },
  { city: 'Puerto Natales',     region: 'Magallanes',  lat: -51.7333, lng: -72.5000 },
  { city: 'San Pedro de Atacama', region: 'Atacama',   lat: -22.9087, lng: -68.1997 },
  { city: 'Villarrica',         region: 'Araucanía',   lat: -39.2817, lng: -72.2311 },
  { city: 'Ancud',              region: 'Los Lagos',   lat: -41.8700, lng: -73.8300 },
  { city: 'Maitencillo',        region: 'Valparaíso',  lat: -32.6500, lng: -71.4833 },
  { city: 'Curacautín',         region: 'Araucanía',   lat: -38.4333, lng: -71.8833 },
  { city: 'Cochrane',           region: 'Aysén',       lat: -47.2500, lng: -72.5833 },
  { city: 'La Serena',          region: 'Coquimbo',    lat: -29.9027, lng: -71.2519 },
  { city: 'Termas de Chillán',  region: 'Biobío',      lat: -36.9083, lng: -71.4333 },
  { city: 'Frutillar',          region: 'Los Lagos',   lat: -41.1297, lng: -73.0556 },
  { city: 'Torres del Paine',   region: 'Magallanes',  lat: -51.0000, lng: -73.0000 },
  { city: 'Olmué',              region: 'Valparaíso',  lat: -33.0000, lng: -71.1833 },
  { city: 'Santa Cruz',         region: "O'Higgins",   lat: -34.6357, lng: -71.3636 },
  { city: 'Constitución',       region: 'Maule',       lat: -35.3333, lng: -72.4167 },
  { city: 'Zapallar',           region: 'Valparaíso',  lat: -32.5546, lng: -71.4596 },
  { city: 'Lago Ranco',         region: 'Los Ríos',    lat: -40.2500, lng: -72.5833 },
  { city: 'Coyhaique',          region: 'Aysén',       lat: -45.5752, lng: -72.0662 },
  { city: 'Vichuquén',          region: 'Maule',       lat: -34.8500, lng: -72.0167 },
  { city: 'Tongoy',             region: 'Coquimbo',    lat: -30.2583, lng: -71.4944 },
  { city: 'Caburgua',           region: 'Araucanía',   lat: -39.1667, lng: -71.7833 },
  { city: 'Peñuelas',           region: 'Valparaíso',  lat: -32.9500, lng: -71.2167 },
  { city: 'Futaleufú',          region: 'Los Lagos',   lat: -43.1833, lng: -71.8667 },
  { city: 'Licán Ray',          region: 'Los Ríos',    lat: -39.5167, lng: -72.1500 },
  { city: 'Matanzas',           region: 'O\'Higgins',  lat: -34.0000, lng: -71.8667 },
  { city: 'Chaitén',            region: 'Los Lagos',   lat: -42.9167, lng: -72.7167 },
  { city: 'Río Hurtado',        region: 'Coquimbo',    lat: -30.4500, lng: -70.8167 },
]

// ─── DATOS POR TIPO ───────────────────────────────────────────────────────────

const TENT_DATA = [
  { suffix: 'Orilla del Río',      desc: 'Parcelas a orilla del río con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza.',       rules: 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno.', amenities: ['Fogón', 'Agua potable', 'Baños compartidos', 'Estacionamiento'] },
  { suffix: 'Bosque Nativo',       desc: 'Camping en bosque nativo con sombra natural todo el día. Rodeado de árboles milenarios y senderos de trekking.',                           rules: 'No recolectar flora. No amplificadores. Basura clasificada obligatoria.', amenities: ['Baños compartidos', 'Duchas', 'Agua potable', 'WiFi en recepción'] },
  { suffix: 'Vista al Volcán',     desc: 'Parcelas con vista panorámica al volcán. Amaneceres espectaculares y cielos despejados para observación de estrellas.',                    rules: 'Silencio desde las 22:00. Fogones habilitados con leña disponible.', amenities: ['Fogón', 'Leña incluida', 'Baños compartidos', 'Mirador'] },
  { suffix: 'Playa Escondida',     desc: 'Camping a pasos de la playa. Acceso directo al mar, duchas con agua caliente y ambiente familiar.',                                         rules: 'No vidrios en la playa. Mascotas permitidas. Check-out 12:00.', amenities: ['Duchas', 'Agua caliente', 'Acceso playa', 'Estacionamiento'] },
  { suffix: 'Laguna Azul',         desc: 'A metros de una laguna cristalina de origen glaciar. Kayaks disponibles para arriendo y guías locales de trekking.',                       rules: 'Prohibido bañarse después del atardecer. No fogatas en verano.', amenities: ['Fogón', 'Baños', 'Duchas', 'Kayak arriendo'] },
  { suffix: 'Montaña Viva',        desc: 'Camping de alta montaña con acceso a senderos de diferente dificultad. Ideal para senderistas y escaladores.',                             rules: 'Check-in 14:00, Check-out 11:00. No ruidos después de las 22:30.', amenities: ['Agua potable', 'Baños', 'Guardería equipos', 'Mapa senderos'] },
  { suffix: 'Valle Verde',         desc: 'Rodeado de viñedos y campos cultivados. Un retiro tranquilo en el corazón del valle central chileno.',                                      rules: 'No ingresar a cultivos. Mascotas en zonas específicas. Sin generadores.', amenities: ['Agua potable', 'Baños', 'Fogón', 'Mesa y sillas'] },
  { suffix: 'Río Cristal',         desc: 'Las aguas del río pasan justo al lado de tus parcelas. Pesca deportiva permitida y piscina natural de agua dulce.',                        rules: 'Pesca con permiso. Niños supervisados en el río. Silencio 22:00.', amenities: ['Fogón', 'Pesca deportiva', 'Baños', 'Agua potable'] },
  { suffix: 'Cerro Alegre',        desc: 'Sube por la mañana al mirador y descansa en tus parcelas con vista de 360 grados a los valles circundantes.',                             rules: 'No camping fuera de zonas delimitadas. Fogones autorizados solo en área común.', amenities: ['Mirador', 'Fogón', 'Baños', 'Agua potable'] },
  { suffix: 'El Refugio',          desc: 'Camping familiar con servicios básicos y un gran quincho comunitario para compartir. Ambiente tranquilo y seguro.',                         rules: 'Silencio nocturno desde las 23:00. Menores de edad requieren adulto responsable.', amenities: ['Quincho', 'Fogón', 'Baños', 'Estacionamiento'] },
]

const CABIN_DATA = [
  { suffix: 'Los Pinos',           desc: 'Acogedoras cabañas de madera nativa con chimenea y vista al lago. Perfectas para desconectarse en pareja o familia.',                    rules: 'No fumar dentro. Check-in 15:00, Check-out 12:00. Sin mascotas de más de 15 kg.', amenities: ['Chimenea', 'Cocina equipada', 'WiFi', 'Ropa de cama'] },
  { suffix: 'Lago Azul',           desc: 'Cabañas frente al lago con muelle propio. Kayaks y SUP incluidos en la estadía.',                                                           rules: 'No fumar dentro. Uso de muelle responsable. Silencio 23:00.', amenities: ['Muelle', 'Kayak incluido', 'Cocina', 'WiFi', 'Calefacción'] },
  { suffix: 'Del Bosque',          desc: 'Cabañas rodeadas de bosque nativo con sendero privado y deck con jacuzzi exterior. Lujo y naturaleza en perfecta armonía.',               rules: 'Jacuzzi solo adultos. Reserva previa para uso. No ingresar a bosque privado.', amenities: ['Jacuzzi', 'Deck', 'WiFi', 'Cocina', 'Calefacción central'] },
  { suffix: 'El Rancho',           desc: 'Estilo ranchero auténtico con caballos disponibles para paseos. Desayuno campesino incluido en temporada alta.',                           rules: 'Niños menores de 12 años requieren adulto en cabalgatas. Desayuno 08:00-10:00.', amenities: ['Caballos', 'Desayuno incluido', 'WiFi', 'Cocina', 'TV'] },
  { suffix: 'Patagonia',           desc: 'Cabañas resistentes al viento patagónico con doble vidrio y calefacción central. Punto de partida ideal para excursiones.',                rules: 'Check-in flexible. Excursiones con guía local recomendadas. No mascotas.', amenities: ['Calefacción central', 'WiFi', 'Guía local', 'Cocina', 'Estacionamiento'] },
  { suffix: 'Las Araucarias',      desc: 'Bajo la sombra de araucarias centenarias, estas cabañas ofrecen el silencio absoluto del sur de Chile.',                                  rules: 'Prohibido cortar ramas o afectar la flora. Silencio total después de 22:00.', amenities: ['WiFi', 'Cocina', 'Estufa a leña', 'Ropa de cama', 'Sendero privado'] },
  { suffix: 'Vista Mar',           desc: 'Cabañas con terraza frente al mar. Acantilados impresionantes y puesta de sol espectacular cada tarde.',                                   rules: 'No acercarse al borde del acantilado. Mascotas en área externa. Check-out 11:00.', amenities: ['Terraza', 'Vista al mar', 'WiFi', 'Cocina', 'Calefacción'] },
  { suffix: 'Montaña Mágica',      desc: 'Inspiradas en el diseño de la Montaña Mágica, estas cabañas son únicas arquitectónicamente y totalmente integradas al entorno.',          rules: 'Máximo 4 personas por cabaña. No mover mobiliario. Check-in 16:00.', amenities: ['Diseño único', 'Jacuzzi', 'Cocina gourmet', 'WiFi', 'Deck'] },
  { suffix: 'Quilanto',            desc: 'Cabañas familiares con piscina temperada y áreas de juego para niños. La opción más completa para familias con niños.',                    rules: 'Piscina supervisada. Salvavidas de 11:00-20:00. Reserva obligatoria.', amenities: ['Piscina temperada', 'Área infantil', 'WiFi', 'Cocina', 'TV'] },
  { suffix: 'Piedra Roja',         desc: 'Cabañas contemporáneas construidas sobre formaciones rocosas. Arquitectura de diseño y vistas que cortan la respiración.',                 rules: 'No escalar formaciones rocosas. Silencio nocturno. Check-in 14:00.', amenities: ['Terraza sobre roca', 'Jacuzzi privado', 'WiFi', 'Cocina gourmet', 'Calefacción'] },
]

const GLAMPING_DATA = [
  { suffix: 'Estrellas',           desc: 'Domos geodésicos transparentes para dormir bajo las estrellas. Camas king, ropa de cama de lujo y desayuno incluido.',                    rules: 'Solo adultos. Reserva con 48h de anticipación mínima. No mascotas.', amenities: ['Domo geodésico', 'Cama king', 'Desayuno incluido', 'WiFi', 'Calefacción'] },
  { suffix: 'Safari',              desc: 'Tendas canvas al estilo safari africano con toda la comodidad. Muebles de diseño, camas elevadas y baño privado.',                         rules: 'No mover el mobiliario. Mascotas pequeñas en consulta. Check-in 15:00.', amenities: ['Tenda canvas', 'Baño privado', 'Cama elevada', 'Muebles diseño', 'Desayuno'] },
  { suffix: 'Cúpula del Cielo',    desc: 'Cúpulas con telescopio para observar el cielo austral. Guía de astronomía incluido los viernes y sábados.',                               rules: 'Silencio total después de 22:00. Luz artificial reducida. Máximo 2 personas.', amenities: ['Telescopio', 'Guía astronomía', 'Cama king', 'Desayuno', 'Calefacción'] },
  { suffix: 'Jardín Secreto',      desc: 'Carpas de lujo escondidas entre jardines floridos. Bañera de pie y servicio de desayuno en la terraza privada cada mañana.',              rules: 'Reserva mínima 2 noches. Fumadores en zona habilitada. Sin mascotas.', amenities: ['Bañera de pie', 'Jardín privado', 'Desayuno en terraza', 'WiFi', 'Aromaterapia'] },
  { suffix: 'Árbol Eterno',        desc: 'Casas en los árboles para adultos. Acceso por escalera de cuerda, vista de las copas del bosque y completo servicio de butlería.',        rules: 'Solo adultos (18+). Peso máximo por persona 100 kg. Reserva con anticipación.', amenities: ['Casa en árbol', 'Butlería', 'Desayuno', 'WiFi', 'Vistas exclusivas'] },
  { suffix: 'Burbujas',            desc: 'Burbujas transparentes con vistas de 360° al entorno natural. Cama con sabanas de 1000 hilos y almohadas premium.',                       rules: 'No fumar. Sin mascotas. Solo para 2 personas. Mínimo 2 noches.', amenities: ['Burbuja 360°', 'Sábanas premium', 'Calefacción', 'Desayuno', 'WiFi'] },
  { suffix: 'Nido de Águila',      desc: 'En lo alto de la colina, estas carpas de lujo tienen la mejor vista del valle. Servicio de spa y masajes disponibles.',                   rules: 'Camino de acceso requiere buen estado físico. Niños con supervisión.', amenities: ['Vista panorámica', 'Spa', 'Masajes', 'Cama king', 'Desayuno'] },
  { suffix: 'Tierra Viva',         desc: 'Glamping ecológico con energía solar, agua de pozo y baño compost. El lujo de la simplicidad consciente.',                                 rules: 'Sistema ecológico. Uso racional del agua. Clasificación de residuos obligatoria.', amenities: ['Energía solar', 'Agua de pozo', 'Cama doble', 'Desayuno orgánico', 'Sendero'] },
  { suffix: 'Las Nubes',           desc: 'En la cima de la montaña, literalmente entre las nubes. Carpas de diseño con calefacción hidrónica y vistas inalcanzables.',              rules: 'Acceso solo con clima favorable. Cancelación gratuita por mal tiempo. Equipamiento incluido.', amenities: ['Calefacción hidrónica', 'Equipo montaña', 'Desayuno', 'Guía', 'WiFi satélite'] },
  { suffix: 'El Oasis',            desc: 'En pleno desierto atacameño, un oasis de lujo y confort. Piscina de inmersión, cenas bajo las estrellas y excursiones al Salar.',          rules: 'Protector solar obligatorio. Hidratación constante. Check-in 16:00.', amenities: ['Piscina de inmersión', 'Cenas incluidas', 'Excursiones', 'WiFi', 'Bar privado'] },
]

const CAMPER_DATA = [
  { suffix: 'Ruta Sur',            desc: 'Sitios para campers y motorhomes con conexión eléctrica 220V, agua potable y descarga de aguas grises. A pie del camino austral.',         rules: 'Conexión eléctrica con cable propio. Descarga responsable. Ruido motor 8:00-22:00.', amenities: ['Electricidad 220V', 'Agua potable', 'Descarga grises', 'WiFi', 'Baños'] },
  { suffix: 'Camino Austral',      desc: 'El punto de parada perfecto en tu aventura por el Camino Austral. Servicios completos, gasolinera cercana y mecánico local.',              rules: 'Nivel máximo de altura 3.5m. Motorhomes reservar con anticipación. No ruido nocturno.', amenities: ['Electricidad', 'Agua', 'Descarga', 'Mecánico local', 'Minimarket'] },
  { suffix: 'Costa Libre',         desc: 'Frente al mar con vista al Pacífico. Sitios amplios, conexión 220V y la mejor puesta de sol del litoral central.',                          rules: 'Mascotas permitidas. Sitios nivelados. Check-in desde 14:00.', amenities: ['Electricidad', 'Agua', 'Vista al mar', 'Baños', 'Duchas calientes'] },
  { suffix: 'Las Terrazas',        desc: 'Terrazas niveladas con sombra natural para campers de todos los tamaños. Internet satelital de alta velocidad incluido.',                    rules: 'Terraza asignada no se puede cambiar. Niveladores obligatorios. Mascotas en zona.', amenities: ['WiFi satélite', 'Electricidad', 'Agua', 'Sombra natural', 'BBQ'] },
  { suffix: 'Paso de Montaña',     desc: 'A 1200 metros de altitud, frente a la cordillera. Temperatura fresca todo el año, ideal para escapar del calor.',                           rules: 'Viento fuerte. Asegurar instalaciones. Generadores solo de 8:00-20:00.', amenities: ['Electricidad', 'Agua', 'Baños cálidos', 'Leña venta', 'Mecánico emergencias'] },
  { suffix: 'Ruta del Vino',       desc: 'En el corazón del valle vitivinícola. Visitas a viñedos a pie desde el camping. Degustaciones con descuento para huéspedes.',               rules: 'Madurez enológica requerida. Mascotas con dueño. Horario viñas 10:00-18:00.', amenities: ['Electricidad', 'Agua', 'Descuentos viñedos', 'WiFi', 'Zona BBQ'] },
  { suffix: 'Norte Grande',        desc: 'En el desierto más árido del mundo. Servicios completos en medio de la nada. La experiencia más extrema y espiritual de Chile.',             rules: 'Agua limitada. Uso racional obligatorio. Temperatura extrema. Hidratación prioritaria.', amenities: ['Electricidad solar', 'Agua potable restringida', 'Baños', 'Sombra artificial', 'GPS'] },
  { suffix: 'Lago Sur',            desc: 'Borde de lago con muelle privado para lancha y kayak. Sitios amplios con vista directa al lago y Los Andes al fondo.',                      rules: 'Muelle compartido por turnos. Pesca permitida con permiso. Velocidad lanchas limitada.', amenities: ['Muelle', 'Electricidad', 'Agua', 'WiFi', 'Kayak arriendo'] },
  { suffix: 'Valle Central',       desc: 'En la zona agrícola más productiva de Chile. Tranquilidad absoluta, campos verdes y una comunidad campesina acogedora.',                    rules: 'Respeto a horarios agrícolas. No ingresar a cultivos. Check-out 11:00.', amenities: ['Electricidad', 'Agua', 'Tienda local', 'BBQ', 'Zona infantil'] },
  { suffix: 'Punta Extremo',       desc: 'El camping más austral de Chile. Una experiencia única en el fin del mundo con servicios esenciales y paisajes de otro planeta.',            rules: 'Equipamiento adecuado al clima obligatorio. Informar itinerario. Rescate coordinado.', amenities: ['Electricidad limitada', 'Agua potable', 'Baños calientes', 'Comunicaciones', 'Guías'] },
]

// ─── HELPERS ──────────────────────────────────────────────────────────────────

function slugify(text) {
  return text.toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s-]/g, '')
    .trim().replace(/\s+/g, '-')
}

function pick(arr, i) { return arr[i % arr.length] }

function imgUrl(seed, w = 800, h = 600) {
  return `https://picsum.photos/seed/${seed}/${w}/${h}`
}

function sleep(ms) { return new Promise(r => setTimeout(r, ms)) }

// ─── CREATE USER ──────────────────────────────────────────────────────────────

async function createUser({ email, full_name, role }) {
  const { data, error } = await admin.auth.admin.createUser({
    email,
    password: PASSWORD,
    email_confirm: true,
    user_metadata: { full_name }
  })
  if (error) {
    if (error.message.includes('already')) {
      console.log(`  ↩  Ya existe: ${email}`)
      const { data: list } = await admin.auth.admin.listUsers()
      const existing = list.users.find(u => u.email === email)
      return existing?.id ?? null
    }
    console.error(`  ✗ Error creando ${email}:`, error.message)
    return null
  }
  const uid = data.user.id
  await admin.from('profiles').update({ full_name, role }).eq('id', uid)
  console.log(`  ✓ ${role.padEnd(8)} ${email}`)
  await sleep(200)
  return uid
}

// ─── MAIN ─────────────────────────────────────────────────────────────────────

async function main() {
  console.log('\n🌿 KARPA — Seed masivo\n')

  // 1. Admin
  console.log('── Admin ──────────────────────────')
  const adminId = await createUser(ADMIN_USER)

  // 2. Hosts
  console.log('\n── Hosts ──────────────────────────')
  const hostIds = []
  for (const h of HOSTS) {
    const id = await createUser(h)
    if (id) hostIds.push({ id, ...h })
  }

  if (hostIds.length === 0) {
    console.error('No se crearon hosts. Abortando.')
    process.exit(1)
  }

  // 3. Campings — 30 por tipo
  const types = [
    { type: 'tent',     data: TENT_DATA,     label: 'Carpas',    priceMin: 8000,  priceMax: 25000  },
    { type: 'cabin',    data: CABIN_DATA,    label: 'Cabañas',   priceMin: 45000, priceMax: 120000 },
    { type: 'glamping', data: GLAMPING_DATA, label: 'Glamping',  priceMin: 80000, priceMax: 250000 },
    { type: 'camper',   data: CAMPER_DATA,   label: 'Camper',    priceMin: 15000, priceMax: 40000  },
  ]

  let totalCampings = 0
  let totalUnits = 0
  let imgSeed = 100

  for (const { type, data, label, priceMin, priceMax } of types) {
    console.log(`\n── ${label} (30) ────────────────────`)

    for (let i = 0; i < 30; i++) {
      const host    = pick(hostIds, i * 3 + types.indexOf({ type, data, label, priceMin, priceMax }))
      const hostObj = pick(hostIds, i)
      const loc     = pick(LOCATIONS, i)
      const d       = pick(data, i)
      const name    = `Camping ${d.suffix} ${loc.city}`
      const baseSlug = slugify(name)
      const slug    = `${baseSlug}-${type}-${i}`

      const latJitter = loc.lat + (Math.random() - 0.5) * 0.05
      const lngJitter = loc.lng + (Math.random() - 0.5) * 0.05

      // Crear camping
      const { data: camping, error: campErr } = await admin.from('campings').insert({
        owner_id:    hostObj.id,
        name,
        slug,
        description: d.desc,
        address:     `Sector ${d.suffix}, camino s/n`,
        city:        loc.city,
        country:     'Chile',
        lat:         latJitter.toFixed(7),
        lng:         lngJitter.toFixed(7),
        rules:       d.rules,
        status:      'active',
      }).select('id').single()

      if (campErr) {
        console.error(`  ✗ ${name}:`, campErr.message)
        continue
      }

      const cid = camping.id
      totalCampings++

      // Imágenes (3 por camping)
      const imgs = []
      for (let p = 0; p < 3; p++) {
        imgs.push({
          camping_id: cid,
          url:        imgUrl(imgSeed++),
          order:      p,
          is_cover:   p === 0,
        })
      }
      await admin.from('camping_images').insert(imgs)

      // Unidad principal del tipo
      const price = Math.round((priceMin + Math.random() * (priceMax - priceMin)) / 1000) * 1000
      const capacityMap = { tent: 4, cabin: 6, glamping: 2, camper: 4 }
      const nameMap     = { tent: 'Parcela', cabin: 'Cabaña', glamping: 'Domo/Carpa Lujo', camper: 'Sitio Camper' }

      const unitsToInsert = [
        {
          camping_id:       cid,
          name:             `${nameMap[type]} ${d.suffix} 1`,
          type,
          capacity:         capacityMap[type],
          price_per_night:  price,
          amenities:        JSON.stringify(d.amenities.slice(0, 4)),
          description:      `Unidad principal con todas las comodidades del camping.`,
          status:           'active',
        },
        {
          camping_id:       cid,
          name:             `${nameMap[type]} ${d.suffix} 2`,
          type,
          capacity:         capacityMap[type],
          price_per_night:  Math.round(price * 0.9 / 1000) * 1000,
          amenities:        JSON.stringify(d.amenities.slice(0, 3)),
          description:      `Segunda unidad disponible, mismas comodidades.`,
          status:           'active',
        },
      ]

      const { error: unitErr } = await admin.from('units').insert(unitsToInsert)
      if (!unitErr) totalUnits += 2

      process.stdout.write(`  ✓ ${name.substring(0, 50).padEnd(50)} [${slug}]\n`)
      await sleep(80)
    }
  }

  console.log(`\n✅ Seed completo`)
  console.log(`   Campings creados : ${totalCampings}`)
  console.log(`   Unidades creadas : ${totalUnits}`)
  console.log(`   Hosts creados    : ${hostIds.length}`)

  // 4. Resumen para el HTML
  const allUsers = [
    { ...ADMIN_USER, id: adminId },
    ...hostIds,
  ]

  console.log('\n── Usuarios creados ───────────────')
  allUsers.forEach(u => console.log(`  ${u.role.padEnd(8)} ${u.email.padEnd(40)} ${u.full_name}`))

  return allUsers
}

main().catch(e => { console.error(e); process.exit(1) })
