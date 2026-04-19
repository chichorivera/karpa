// Genera el tutorial HTML de Karpa
// node scripts/generate-tutorial-html.mjs > scripts/karpa-tutorial.html

const PASSWORD = '1q2w3e4r'
const BASE_URL = 'https://karpamvp.netlify.app'

const USERS = [
  { email: 'admin@karpa.cl',             full_name: 'Administrador Karpa', role: 'Admin',    panel: '/admin' },
  { email: 'carlos.mendoza@karpa.cl',    full_name: 'Carlos Mendoza',      role: 'Host',     panel: '/host/campings' },
  { email: 'maria.gonzalez@karpa.cl',    full_name: 'María González',      role: 'Host',     panel: '/host/campings' },
  { email: 'pedro.rojas@karpa.cl',       full_name: 'Pedro Rojas',         role: 'Host',     panel: '/host/campings' },
  { email: 'ana.martinez@karpa.cl',      full_name: 'Ana Martínez',        role: 'Host',     panel: '/host/campings' },
  { email: 'luis.fernandez@karpa.cl',    full_name: 'Luis Fernández',      role: 'Host',     panel: '/host/campings' },
  { email: 'carmen.lopez@karpa.cl',      full_name: 'Carmen López',        role: 'Host',     panel: '/host/campings' },
  { email: 'jorge.sanchez@karpa.cl',     full_name: 'Jorge Sánchez',       role: 'Host',     panel: '/host/campings' },
  { email: 'valentina.torres@karpa.cl',  full_name: 'Valentina Torres',    role: 'Host',     panel: '/host/campings' },
  { email: 'roberto.diaz@karpa.cl',      full_name: 'Roberto Díaz',        role: 'Host',     panel: '/host/campings' },
  { email: 'sofia.munoz@karpa.cl',       full_name: 'Sofía Muñoz',         role: 'Host',     panel: '/host/campings' },
  { email: 'viajero1@karpa.cl',          full_name: 'Juan Pérez',          role: 'Viajero',  panel: '/app/dashboard' },
  { email: 'viajero2@karpa.cl',          full_name: 'Claudia Ramos',       role: 'Viajero',  panel: '/app/dashboard' },
  { email: 'viajero3@karpa.cl',          full_name: 'Matías Herrera',      role: 'Viajero',  panel: '/app/dashboard' },
]

const html = `<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Karpa — Tutorial de la Plataforma</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    :root {
      --madera:  #6D4C3D;
      --bosque:  #2E593F;
      --naranja: #F27C38;
      --arena:   #F4E8D4;
      --crema:   #D9C3A5;
      --bg:      #faf8f5;
      --text:    #1a1a1a;
    }
    body {
      font-family: 'Segoe UI', system-ui, sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.6;
    }
    .cover {
      background: linear-gradient(135deg, #2E593F 0%, #3d6e50 50%, #6D4C3D 100%);
      color: white;
      padding: 80px 40px;
      text-align: center;
    }
    .cover img.logo { height: 52px; width: auto; margin-bottom: 20px; }
    .cover .subtitle { font-size: 1.2rem; opacity: 0.8; margin-bottom: 8px; color: white; }
    .cover .date { font-size: 0.85rem; opacity: 0.5; color: white; }
    .toc-wrap { background: white; border-bottom: 1px solid var(--crema); }
    .toc { max-width: 900px; margin: 0 auto; padding: 24px 32px; }
    .toc h2 { font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 2px; color: var(--madera); margin-bottom: 12px; }
    .toc ol { padding-left: 20px; columns: 2; gap: 24px; }
    .toc li { font-size: 0.9rem; margin-bottom: 6px; }
    .toc a { color: var(--bosque); text-decoration: none; }
    .toc a:hover { text-decoration: underline; }
    .page { max-width: 900px; margin: 0 auto; padding: 32px; }
    section { margin-bottom: 48px; scroll-margin-top: 80px; }
    h2.section-title {
      font-size: 1.6rem; font-weight: 700;
      color: var(--bosque); border-left: 4px solid var(--naranja);
      padding-left: 16px; margin-bottom: 20px;
    }
    h3 { font-size: 1.1rem; font-weight: 600; color: var(--madera); margin: 20px 0 10px; }
    p { font-size: 0.93rem; color: #444; margin-bottom: 10px; }
    ul, ol { font-size: 0.93rem; color: #444; padding-left: 22px; margin-bottom: 12px; }
    li { margin-bottom: 5px; }
    .badge {
      display: inline-block; font-size: 0.7rem; font-weight: 700; padding: 3px 10px;
      border-radius: 99px; text-transform: uppercase; letter-spacing: 0.5px;
    }
    .badge-admin   { background: #1e3a5f; color: white; }
    .badge-host    { background: var(--bosque); color: white; }
    .badge-viajero { background: var(--naranja); color: white; }
    .card {
      background: white; border: 1px solid var(--crema); border-radius: 12px;
      padding: 20px 24px; margin-bottom: 12px;
    }
    .card-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 12px; }
    .user-card {
      background: white; border: 1px solid var(--crema); border-radius: 12px;
      padding: 16px 20px; display: flex; flex-direction: column; gap: 8px;
    }
    .user-name { font-weight: 700; font-size: 0.95rem; }
    .user-email { font-size: 0.82rem; color: #777; font-family: monospace; }
    .user-pass { font-size: 0.82rem; color: #999; }
    .user-pass code {
      background: var(--arena); color: var(--madera); padding: 2px 8px;
      border-radius: 6px; font-size: 0.85rem; font-weight: 700;
    }
    .user-panel a { font-size: 0.8rem; color: var(--bosque); text-decoration: none; font-weight: 600; }
    .user-panel a:hover { text-decoration: underline; }
    .step {
      display: flex; gap: 16px; align-items: flex-start;
      background: white; border: 1px solid var(--crema); border-radius: 12px;
      padding: 16px 20px; margin-bottom: 10px;
    }
    .step-num {
      min-width: 32px; height: 32px; border-radius: 50%;
      background: var(--bosque); color: white; font-weight: 700; font-size: 0.9rem;
      display: flex; align-items: center; justify-content: center;
    }
    .step-body h4 { font-weight: 600; margin-bottom: 4px; font-size: 0.93rem; }
    .step-body p  { font-size: 0.87rem; color: #666; margin: 0; }
    .url-box {
      background: var(--arena); border: 1px solid var(--crema); border-radius: 8px;
      padding: 12px 16px; font-family: monospace; font-size: 0.88rem; color: var(--madera);
      margin: 10px 0; word-break: break-all;
    }
    .warning {
      background: #fff8e1; border: 1px solid #ffe082; border-radius: 10px;
      padding: 14px 18px; font-size: 0.88rem; color: #7a6000; margin: 16px 0;
    }
    .success {
      background: #e8f5e9; border: 1px solid #a5d6a7; border-radius: 10px;
      padding: 14px 18px; font-size: 0.88rem; color: #2e7d32; margin: 16px 0;
    }
    table { width: 100%; border-collapse: collapse; font-size: 0.88rem; margin: 12px 0; }
    th { background: var(--bosque); color: white; padding: 10px 14px; text-align: left; }
    td { padding: 9px 14px; border-bottom: 1px solid var(--crema); }
    tr:nth-child(even) td { background: #fdfcfa; }
    .footer {
      background: var(--madera); color: white/70; text-align: center;
      padding: 24px; font-size: 0.82rem; color: rgba(255,255,255,0.6);
      margin-top: 60px;
    }
    @media print {
      .toc-wrap, nav { display: none; }
      .cover { padding: 40px 20px; }
      section { page-break-inside: avoid; }
    }
  </style>
</head>
<body>

<!-- PORTADA -->
<div class="cover">
  <div style="display:flex;align-items:center;justify-content:center;gap:14px;margin-bottom:24px">
    <img src="${BASE_URL}/favicon.png" alt="" style="height:40px;width:40px;object-fit:contain" />
    <img src="${BASE_URL}/logo-karpa-blanco.png" alt="Karpa" class="logo" style="margin-bottom:0" />
  </div>
  <p class="subtitle">Tutorial completo de la plataforma — MVP v1.0</p>
  <p class="date">Generado el ${new Date().toLocaleDateString('es-CL', { dateStyle: 'long' })}</p>
</div>

<!-- ÍNDICE -->
<div class="toc-wrap">
  <div class="toc">
    <h2>Contenido</h2>
    <ol>
      <li><a href="#overview">Visión general</a></li>
      <li><a href="#roles">Roles y permisos</a></li>
      <li><a href="#viajero">Tutorial: Viajero</a></li>
      <li><a href="#host">Tutorial: Dueño de Camping</a></li>
      <li><a href="#admin">Tutorial: Administrador</a></li>
      <li><a href="#pagos">Sistema de pagos</a></li>
      <li><a href="#usuarios">Usuarios creados</a></li>
      <li><a href="#tech">Stack tecnológico</a></li>
    </ol>
  </div>
</div>

<div class="page">

<!-- 1. OVERVIEW -->
<section id="overview">
  <h2 class="section-title">1. Visión general</h2>
  <div class="card">
    <p><strong>Karpa</strong> es el marketplace de campings en Chile. Conecta a viajeros que buscan escapadas en la naturaleza con dueños de campings, glamping y cabañas que quieren publicar y gestionar sus espacios.</p>
    <p style="margin:0">Es un clon en funcionalidades de Airbnb, orientado exclusivamente al ecosistema del camping y el turismo outdoor en Chile.</p>
  </div>
  <div class="url-box">${BASE_URL}</div>
  <div class="card-grid" style="margin-top:16px">
    <div class="card">
      <h3 style="margin-top:0">🔍 Búsqueda</h3>
      <p style="margin:0">Busca por nombre, ciudad o tipo de alojamiento. Filtra por fechas, tipo y precio.</p>
    </div>
    <div class="card">
      <h3 style="margin-top:0">📅 Reservas</h3>
      <p style="margin:0">Selecciona fechas y unidad, paga con Webpay y recibe confirmación por email.</p>
    </div>
    <div class="card">
      <h3 style="margin-top:0">🏕️ Publicación</h3>
      <p style="margin:0">Los dueños crean su camping, agregan parcelas/cabañas y gestionan reservas.</p>
    </div>
  </div>
</section>

<!-- 2. ROLES -->
<section id="roles">
  <h2 class="section-title">2. Roles y permisos</h2>
  <table>
    <thead>
      <tr><th>Rol</th><th>Qué puede hacer</th><th>Panel</th></tr>
    </thead>
    <tbody>
      <tr>
        <td><span class="badge badge-viajero">Viajero</span></td>
        <td>Buscar campings, ver detalles, reservar, pagar, ver historial, dejar reseñas</td>
        <td><code>/app/dashboard</code></td>
      </tr>
      <tr>
        <td><span class="badge badge-host">Host</span></td>
        <td>Crear y editar campings, agregar parcelas/cabañas, ver y gestionar reservas, ver pagos</td>
        <td><code>/host/campings</code></td>
      </tr>
      <tr>
        <td><span class="badge badge-admin">Admin</span></td>
        <td>Ver todos los campings, aprobar/pausar publicaciones, ver estadísticas globales</td>
        <td><code>/admin</code></td>
      </tr>
    </tbody>
  </table>
</section>

<!-- 3. VIAJERO -->
<section id="viajero">
  <h2 class="section-title">3. Tutorial: Viajero</h2>

  <h3>Registro y acceso</h3>
  <div class="step">
    <div class="step-num">1</div>
    <div class="step-body">
      <h4>Crear cuenta</h4>
      <p>Ir a <strong>${BASE_URL}/auth/register</strong>, elegir rol <em>Viajero</em>, ingresar nombre, email y contraseña.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">2</div>
    <div class="step-body">
      <h4>Iniciar sesión</h4>
      <p>Ir a <strong>${BASE_URL}/auth/login</strong> con el email y contraseña registrados.</p>
    </div>
  </div>

  <h3>Buscar un camping</h3>
  <div class="step">
    <div class="step-num">3</div>
    <div class="step-body">
      <h4>Usar el buscador del home</h4>
      <p>Escribe el nombre de una ciudad o camping en el campo de búsqueda del home y haz clic en <em>Buscar</em>.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">4</div>
    <div class="step-body">
      <h4>Explorar por tipo</h4>
      <p>Haz clic en Carpas, Cabañas, Glamping o Camper en la sección <em>Explora por tipo</em> del home.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">5</div>
    <div class="step-body">
      <h4>Ver detalle del camping</h4>
      <p>Haz clic en cualquier camping para ver fotos, galería completa, descripción, parcelas disponibles, precios, mapa y reseñas.</p>
    </div>
  </div>

  <h3>Hacer una reserva</h3>
  <div class="step">
    <div class="step-num">6</div>
    <div class="step-body">
      <h4>Seleccionar parcela</h4>
      <p>En el detalle del camping, elegir la parcela o cabaña deseada y hacer clic en <em>Reservar esta parcela</em>.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">7</div>
    <div class="step-body">
      <h4>Elegir fechas</h4>
      <p>Seleccionar fecha de check-in y check-out. El sistema calcula el total automáticamente.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">8</div>
    <div class="step-body">
      <h4>Pagar con Webpay</h4>
      <p>Hacer clic en <em>Ir a pagar</em>. Serás redirigido a Webpay Plus de Transbank. En entorno de pruebas, usar tarjeta <strong>4051 8856 0044 6623</strong>, CVV <strong>123</strong>, cualquier fecha futura.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">9</div>
    <div class="step-body">
      <h4>Confirmación</h4>
      <p>Tras el pago, recibirás email de confirmación y tu reserva aparecerá en <em>Mis Reservas</em>.</p>
    </div>
  </div>

  <div class="url-box">${BASE_URL}/app/dashboard — Panel del viajero</div>
</section>

<!-- 4. HOST -->
<section id="host">
  <h2 class="section-title">4. Tutorial: Dueño de Camping</h2>

  <h3>Registro como Host</h3>
  <div class="step">
    <div class="step-num">1</div>
    <div class="step-body">
      <h4>Crear cuenta Host</h4>
      <p>Ir a <strong>${BASE_URL}/auth/register</strong> y elegir rol <em>Dueño de Camping</em>.</p>
    </div>
  </div>

  <h3>Crear un camping</h3>
  <div class="step">
    <div class="step-num">2</div>
    <div class="step-body">
      <h4>Acceder al panel</h4>
      <p>Tras iniciar sesión, ir a <strong>${BASE_URL}/host/campings</strong>.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">3</div>
    <div class="step-body">
      <h4>Nuevo camping</h4>
      <p>Hacer clic en <em>Crear camping</em>. Completar: nombre, descripción, dirección, ciudad, coordenadas GPS, reglas y estado (activo/borrador).</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">4</div>
    <div class="step-body">
      <h4>Agregar parcelas/cabañas</h4>
      <p>Desde la ficha del camping, ir a <em>Unidades</em> → <em>Nueva unidad</em>. Definir nombre, tipo, capacidad, precio por noche y amenidades.</p>
    </div>
  </div>

  <h3>Gestionar reservas</h3>
  <div class="step">
    <div class="step-num">5</div>
    <div class="step-body">
      <h4>Ver reservas</h4>
      <p>En <strong>${BASE_URL}/host/bookings</strong> verás todas las reservas activas y pendientes de tus campings.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">6</div>
    <div class="step-body">
      <h4>Confirmar / cancelar</h4>
      <p>Puedes cambiar el estado de cada reserva. Los viajeros reciben email automático al confirmarse.</p>
    </div>
  </div>

  <div class="url-box">${BASE_URL}/host/campings — Panel del host</div>
</section>

<!-- 5. ADMIN -->
<section id="admin">
  <h2 class="section-title">5. Tutorial: Administrador</h2>

  <div class="step">
    <div class="step-num">1</div>
    <div class="step-body">
      <h4>Acceder al panel admin</h4>
      <p>Iniciar sesión con cuenta de rol Admin. El sistema redirige automáticamente a <strong>${BASE_URL}/admin</strong>.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">2</div>
    <div class="step-body">
      <h4>Dashboard</h4>
      <p>Vista general con métricas: total de campings, reservas recientes, pagos, usuarios registrados.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">3</div>
    <div class="step-body">
      <h4>Gestión de campings</h4>
      <p>Ver todos los campings publicados. Cambiar estado a <em>activo</em>, <em>borrador</em> o <em>pausado</em>.</p>
    </div>
  </div>
  <div class="step">
    <div class="step-num">4</div>
    <div class="step-body">
      <h4>Gestión de usuarios</h4>
      <p>Ver todos los usuarios registrados, sus roles y fecha de registro.</p>
    </div>
  </div>

  <div class="url-box">${BASE_URL}/admin — Panel de administración</div>
</section>

<!-- 6. PAGOS -->
<section id="pagos">
  <h2 class="section-title">6. Sistema de pagos</h2>
  <div class="card">
    <h3 style="margin-top:0">Webpay Plus (Transbank)</h3>
    <p>Karpa utiliza Webpay Plus de Transbank, el sistema de pago más utilizado en Chile. Acepta tarjetas de débito, crédito y prepago.</p>
    <p>Actualmente el sistema está en <strong>modo integración (pruebas)</strong>. Para producción se deben cambiar las credenciales en Netlify.</p>
  </div>

  <h3>Tarjetas de prueba (Transbank integración)</h3>
  <table>
    <thead>
      <tr><th>Tarjeta</th><th>Número</th><th>CVV</th><th>Resultado</th></tr>
    </thead>
    <tbody>
      <tr><td>VISA Crédito</td><td>4051 8856 0044 6623</td><td>123</td><td>✅ Aprobado</td></tr>
      <tr><td>MasterCard</td><td>5186 0595 5959 0568</td><td>123</td><td>✅ Aprobado</td></tr>
      <tr><td>VISA Débito</td><td>4235 6938 0153 6678</td><td>786</td><td>✅ Aprobado</td></tr>
      <tr><td>VISA Rechazo</td><td>4111 1111 1111 1111</td><td>123</td><td>❌ Rechazado</td></tr>
    </tbody>
  </table>
  <p style="font-size:0.82rem;color:#999">RUT de prueba: 11.111.111-1 · Contraseña: 123</p>

  <h3>Flujo de pago</h3>
  <ol>
    <li>Viajero selecciona parcela y fechas</li>
    <li>API crea booking en estado <code>pending</code></li>
    <li>Redirige a Webpay Plus de Transbank</li>
    <li>Transbank procesa el pago</li>
    <li>Callback a <code>/api/payments/confirm</code></li>
    <li>Booking pasa a <code>confirmed</code>, payment a <code>paid</code></li>
    <li>Email automático al viajero y al host</li>
  </ol>
</section>

<!-- 7. USUARIOS -->
<section id="usuarios">
  <h2 class="section-title">7. Usuarios creados</h2>
  <div class="success">Todos los usuarios tienen la misma contraseña: <code style="background:rgba(0,0,0,0.1);padding:2px 8px;border-radius:4px;font-weight:700">1q2w3e4r</code></div>

  <h3>Administrador</h3>
  <div class="card-grid">
    ${USERS.filter(u => u.role === 'Admin').map(u => `
    <div class="user-card">
      <div style="display:flex;align-items:center;gap:8px">
        <span class="badge badge-admin">${u.role}</span>
        <span class="user-name">${u.full_name}</span>
      </div>
      <div class="user-email">${u.email}</div>
      <div class="user-pass">Password: <code>${PASSWORD}</code></div>
      <div class="user-panel"><a href="${BASE_URL}${u.panel}" target="_blank">→ ${u.panel}</a></div>
    </div>`).join('')}
  </div>

  <h3>Hosts (dueños de camping)</h3>
  <div class="card-grid">
    ${USERS.filter(u => u.role === 'Host').map(u => `
    <div class="user-card">
      <div style="display:flex;align-items:center;gap:8px">
        <span class="badge badge-host">${u.role}</span>
        <span class="user-name">${u.full_name}</span>
      </div>
      <div class="user-email">${u.email}</div>
      <div class="user-pass">Password: <code>${PASSWORD}</code></div>
      <div class="user-panel"><a href="${BASE_URL}${u.panel}" target="_blank">→ ${u.panel}</a></div>
    </div>`).join('')}
  </div>

  <h3>Viajeros</h3>
  <div class="card-grid">
    ${USERS.filter(u => u.role === 'Viajero').map(u => `
    <div class="user-card">
      <div style="display:flex;align-items:center;gap:8px">
        <span class="badge badge-viajero">${u.role}</span>
        <span class="user-name">${u.full_name}</span>
      </div>
      <div class="user-email">${u.email}</div>
      <div class="user-pass">Password: <code>${PASSWORD}</code></div>
      <div class="user-panel"><a href="${BASE_URL}${u.panel}" target="_blank">→ ${u.panel}</a></div>
    </div>`).join('')}
  </div>

  <h3>Resumen de campings cargados</h3>
  <table>
    <thead>
      <tr><th>Tipo</th><th>Cantidad</th><th>Precio rango</th><th>Unidades por camping</th></tr>
    </thead>
    <tbody>
      <tr><td>🏕️ Carpas (tent)</td><td>30</td><td>$8.000 – $25.000/noche</td><td>2 parcelas</td></tr>
      <tr><td>🏠 Cabañas (cabin)</td><td>30</td><td>$45.000 – $120.000/noche</td><td>2 cabañas</td></tr>
      <tr><td>✨ Glamping</td><td>30</td><td>$80.000 – $250.000/noche</td><td>2 domos</td></tr>
      <tr><td>🚐 Camper</td><td>30</td><td>$15.000 – $40.000/noche</td><td>2 sitios</td></tr>
      <tr><td><strong>Total</strong></td><td><strong>120</strong></td><td>—</td><td><strong>240 unidades</strong></td></tr>
    </tbody>
  </table>
</section>

<!-- 8. TECH -->
<section id="tech">
  <h2 class="section-title">8. Stack tecnológico</h2>
  <div class="card-grid">
    <div class="card">
      <h3 style="margin-top:0">Frontend</h3>
      <ul style="margin:0">
        <li><strong>Astro 5</strong> — SSR full</li>
        <li><strong>Tailwind CSS v4</strong></li>
        <li>Playfair Display + Inter</li>
      </ul>
    </div>
    <div class="card">
      <h3 style="margin-top:0">Backend</h3>
      <ul style="margin:0">
        <li><strong>Supabase</strong> — PostgreSQL + Auth + RLS</li>
        <li><strong>Netlify</strong> — Hosting + Functions</li>
        <li><strong>Resend</strong> — Email transaccional</li>
      </ul>
    </div>
    <div class="card">
      <h3 style="margin-top:0">Pagos & Mapas</h3>
      <ul style="margin:0">
        <li><strong>Webpay Plus</strong> (Transbank SDK)</li>
        <li><strong>Leaflet + OpenStreetMap</strong></li>
      </ul>
    </div>
    <div class="card">
      <h3 style="margin-top:0">Repo & Deploy</h3>
      <ul style="margin:0">
        <li>GitHub: chichorivera/karpa</li>
        <li>Deploy automático en push a main</li>
        <li>Node 22+ requerido</li>
      </ul>
    </div>
  </div>

  <div class="warning">
    <strong>⚠️ Entorno de producción pendiente:</strong> Se deben configurar las 8 variables de entorno en Netlify y las URLs de autenticación en Supabase antes de usar en producción real. Ver documentación de deploy en el repositorio.
  </div>
</section>

</div>

<div class="footer">
  Karpa MVP v1.0 — Desarrollado por <strong style="color:white">XIMIO</strong> — ${new Date().getFullYear()}
</div>

</body>
</html>`

process.stdout.write(html)
