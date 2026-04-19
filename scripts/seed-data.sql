-- ================================================================
-- KARPA — Seed masivo
-- Contraseña de todos los usuarios: 1q2w3e4r
-- Ejecutar en Supabase SQL Editor
-- ================================================================

DO $$
DECLARE
  v_uid uuid;
  v_cid uuid;
BEGIN

-- ── USUARIOS ──────────────────────────────────────────────────────
-- Administrador Karpa (admin)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000001-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'admin@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Administrador Karpa"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000001-0000-4000-8000-000000000000', '00000001-0000-4000-8000-000000000000',
  '{"sub":"00000001-0000-4000-8000-000000000000","email":"admin@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Carlos Mendoza (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000002-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'carlos.mendoza@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Carlos Mendoza"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000002-0000-4000-8000-000000000000', '00000002-0000-4000-8000-000000000000',
  '{"sub":"00000002-0000-4000-8000-000000000000","email":"carlos.mendoza@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- María González (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000003-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'maria.gonzalez@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"María González"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000003-0000-4000-8000-000000000000', '00000003-0000-4000-8000-000000000000',
  '{"sub":"00000003-0000-4000-8000-000000000000","email":"maria.gonzalez@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Pedro Rojas (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000004-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'pedro.rojas@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Pedro Rojas"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000004-0000-4000-8000-000000000000', '00000004-0000-4000-8000-000000000000',
  '{"sub":"00000004-0000-4000-8000-000000000000","email":"pedro.rojas@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Ana Martínez (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000005-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'ana.martinez@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Ana Martínez"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000005-0000-4000-8000-000000000000', '00000005-0000-4000-8000-000000000000',
  '{"sub":"00000005-0000-4000-8000-000000000000","email":"ana.martinez@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Luis Fernández (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000006-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'luis.fernandez@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Luis Fernández"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000006-0000-4000-8000-000000000000', '00000006-0000-4000-8000-000000000000',
  '{"sub":"00000006-0000-4000-8000-000000000000","email":"luis.fernandez@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Carmen López (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000007-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'carmen.lopez@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Carmen López"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000007-0000-4000-8000-000000000000', '00000007-0000-4000-8000-000000000000',
  '{"sub":"00000007-0000-4000-8000-000000000000","email":"carmen.lopez@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Jorge Sánchez (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000008-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'jorge.sanchez@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Jorge Sánchez"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000008-0000-4000-8000-000000000000', '00000008-0000-4000-8000-000000000000',
  '{"sub":"00000008-0000-4000-8000-000000000000","email":"jorge.sanchez@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Valentina Torres (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '00000009-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'valentina.torres@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Valentina Torres"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '00000009-0000-4000-8000-000000000000', '00000009-0000-4000-8000-000000000000',
  '{"sub":"00000009-0000-4000-8000-000000000000","email":"valentina.torres@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Roberto Díaz (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '0000000a-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'roberto.diaz@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Roberto Díaz"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '0000000a-0000-4000-8000-000000000000', '0000000a-0000-4000-8000-000000000000',
  '{"sub":"0000000a-0000-4000-8000-000000000000","email":"roberto.diaz@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Sofía Muñoz (host)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '0000000b-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'sofia.munoz@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Sofía Muñoz"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '0000000b-0000-4000-8000-000000000000', '0000000b-0000-4000-8000-000000000000',
  '{"sub":"0000000b-0000-4000-8000-000000000000","email":"sofia.munoz@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Juan Pérez (traveler)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '0000000c-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'viajero1@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Juan Pérez"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '0000000c-0000-4000-8000-000000000000', '0000000c-0000-4000-8000-000000000000',
  '{"sub":"0000000c-0000-4000-8000-000000000000","email":"viajero1@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Claudia Ramos (traveler)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '0000000d-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'viajero2@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Claudia Ramos"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '0000000d-0000-4000-8000-000000000000', '0000000d-0000-4000-8000-000000000000',
  '{"sub":"0000000d-0000-4000-8000-000000000000","email":"viajero2@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- Matías Herrera (traveler)
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password,
  email_confirmed_at, created_at, updated_at,
  raw_app_meta_data, raw_user_meta_data, is_super_admin, is_sso_user
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '0000000e-0000-4000-8000-000000000000',
  'authenticated', 'authenticated',
  'viajero3@karpa.cl',
  '$2b$10$RO45nSy7.lwaXCpafuoGJ.2p.Q172N5q4ZzHR5WfneJ5vOW0YG4x6',
  now(), now(), now(),
  '{"provider":"email","providers":["email"]}',
  '{"full_name":"Matías Herrera"}',
  false, false
) ON CONFLICT (email) DO NOTHING;

INSERT INTO auth.identities (id, provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
VALUES (
  gen_random_uuid(), '0000000e-0000-4000-8000-000000000000', '0000000e-0000-4000-8000-000000000000',
  '{"sub":"0000000e-0000-4000-8000-000000000000","email":"viajero3@karpa.cl"}',
  'email', now(), now(), now()
) ON CONFLICT DO NOTHING;

-- ── PROFILES ──────────────────────────────────────────────────────
INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000001-0000-4000-8000-000000000000', 'Administrador Karpa', 'admin')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000002-0000-4000-8000-000000000000', 'Carlos Mendoza', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000003-0000-4000-8000-000000000000', 'María González', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000004-0000-4000-8000-000000000000', 'Pedro Rojas', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000005-0000-4000-8000-000000000000', 'Ana Martínez', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000006-0000-4000-8000-000000000000', 'Luis Fernández', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000007-0000-4000-8000-000000000000', 'Carmen López', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000008-0000-4000-8000-000000000000', 'Jorge Sánchez', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('00000009-0000-4000-8000-000000000000', 'Valentina Torres', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('0000000a-0000-4000-8000-000000000000', 'Roberto Díaz', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('0000000b-0000-4000-8000-000000000000', 'Sofía Muñoz', 'host')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('0000000c-0000-4000-8000-000000000000', 'Juan Pérez', 'traveler')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('0000000d-0000-4000-8000-000000000000', 'Claudia Ramos', 'traveler')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

INSERT INTO public.profiles (id, full_name, role)
VALUES ('0000000e-0000-4000-8000-000000000000', 'Matías Herrera', 'traveler')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, role = EXCLUDED.role;

-- ── CAMPINGS ──────────────────────────────────────────────────────
-- Tipo: tent
v_cid := '000003e9-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Orilla del Río Pucón', 'camping-orilla-del-rio-pucon-tent-1', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Orilla del Río, camino s/n', 'Pucón', 'Chile', -39.2959, -72.0002, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/200/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/201/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/202/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/203/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/204/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Orilla del Río 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Orilla del Río 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003ea-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Bosque Nativo Puerto Varas', 'camping-bosque-nativo-puerto-varas-tent-2', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Bosque Nativo, camino s/n', 'Puerto Varas', 'Chile', -41.3397, -73.007, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/205/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/206/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/207/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/208/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/209/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Bosque Nativo 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Bosque Nativo 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003eb-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Vista al Volcán San José de Maipo', 'camping-vista-al-volcan-san-jose-de-maipo-tent-3', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Vista al Volcán, camino s/n', 'San José de Maipo', 'Chile', -33.6569, -70.3693, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/210/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/211/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/212/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/213/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/214/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Vista al Volcán 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Vista al Volcán 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003ec-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping Playa Escondida Cajón del Maipo', 'camping-playa-escondida-cajon-del-maipo-tent-4', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Playa Escondida, camino s/n', 'Cajón del Maipo', 'Chile', -33.7963, -70.0963, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/215/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/216/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/217/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/218/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/219/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Playa Escondida 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Playa Escondida 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003ed-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Laguna Azul Puerto Natales', 'camping-laguna-azul-puerto-natales-tent-5', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Laguna Azul, camino s/n', 'Puerto Natales', 'Chile', -51.7428, -72.5095, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/220/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/221/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/222/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/223/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/224/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Laguna Azul 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Laguna Azul 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003ee-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Montaña Viva San Pedro de Atacama', 'camping-montana-viva-san-pedro-de-atacama-tent-6', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Montaña Viva, camino s/n', 'San Pedro de Atacama', 'Chile', -22.9147, -68.2057, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/225/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/226/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/227/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/228/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/229/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Montaña Viva 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Montaña Viva 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003ef-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Valle Verde Villarrica', 'camping-valle-verde-villarrica-tent-7', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Valle Verde, camino s/n', 'Villarrica', 'Chile', -39.2842, -72.2336, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/230/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/231/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/232/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/233/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/234/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Valle Verde 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Valle Verde 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f0-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Río Cristal Ancud', 'camping-rio-cristal-ancud-tent-8', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Río Cristal, camino s/n', 'Ancud', 'Chile', -41.869, -73.829, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/235/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/236/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/237/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/238/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/239/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Río Cristal 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Río Cristal 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f1-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Cerro Alegre Maitencillo', 'camping-cerro-alegre-maitencillo-tent-9', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Cerro Alegre, camino s/n', 'Maitencillo', 'Chile', -32.6455, -71.4788, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/240/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/241/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/242/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/243/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/244/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Cerro Alegre 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Cerro Alegre 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f2-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping El Refugio Curacautín', 'camping-el-refugio-curacautin-tent-10', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector El Refugio, camino s/n', 'Curacautín', 'Chile', -38.4253, -71.8753, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/245/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/246/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/247/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/248/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/249/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Refugio 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Refugio 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f3-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Sendero del Viento Cochrane', 'camping-sendero-del-viento-cochrane-tent-11', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Sendero del Viento, camino s/n', 'Cochrane', 'Chile', -47.2385, -72.5718, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/250/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/251/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/252/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/253/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/254/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Sendero del Viento 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Sendero del Viento 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f4-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Noche Estrellada La Serena', 'camping-noche-estrellada-la-serena-tent-12', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Noche Estrellada, camino s/n', 'La Serena', 'Chile', -29.8877, -71.2369, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/255/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/256/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/257/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/258/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/259/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Noche Estrellada 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Noche Estrellada 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f5-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Rincón Tranquilo Termas de Chillán', 'camping-rincon-tranquilo-termas-de-chillan-tent-13', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Rincón Tranquilo, camino s/n', 'Termas de Chillán', 'Chile', -36.8898, -71.4148, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/260/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/261/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/262/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/263/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/264/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Rincón Tranquilo 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Rincón Tranquilo 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f6-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping El Manantial Frutillar', 'camping-el-manantial-frutillar-tent-14', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector El Manantial, camino s/n', 'Frutillar', 'Chile', -41.1077, -73.0336, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/265/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/266/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/267/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/268/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/269/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Manantial 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Manantial 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f7-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Praderas del Sur Torres del Paine', 'camping-praderas-del-sur-torres-del-paine-tent-15', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Praderas del Sur, camino s/n', 'Torres del Paine', 'Chile', -51.0245, -73.0245, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/270/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/271/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/272/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/273/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/274/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Praderas del Sur 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Praderas del Sur 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f8-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Quebrada Verde Olmué', 'camping-quebrada-verde-olmue-tent-16', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Quebrada Verde, camino s/n', 'Olmué', 'Chile', -33.021, -71.2043, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/275/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/276/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/277/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/278/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/279/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Quebrada Verde 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Quebrada Verde 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003f9-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Alto del Cielo Santa Cruz', 'camping-alto-del-cielo-santa-cruz-tent-17', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Alto del Cielo, camino s/n', 'Santa Cruz', 'Chile', -34.6532, -71.3811, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/280/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/281/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/282/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/283/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/284/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Alto del Cielo 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Alto del Cielo 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003fa-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Punta del Lago Constitución', 'camping-punta-del-lago-constitucion-tent-18', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Punta del Lago, camino s/n', 'Constitución', 'Chile', -35.3473, -72.4307, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/285/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/286/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/287/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/288/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/289/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Punta del Lago 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Punta del Lago 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003fb-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Los Canelos Zapallar', 'camping-los-canelos-zapallar-tent-19', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Los Canelos, camino s/n', 'Zapallar', 'Chile', -32.5651, -71.4701, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/290/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/291/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/292/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/293/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/294/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Los Canelos 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Los Canelos 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003fc-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping El Sauce Lago Ranco', 'camping-el-sauce-lago-ranco-tent-20', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector El Sauce, camino s/n', 'Lago Ranco', 'Chile', -40.257, -72.5903, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/295/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/296/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/297/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/298/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/299/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Sauce 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Sauce 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003fd-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Aguada Clara Coyhaique', 'camping-aguada-clara-coyhaique-tent-21', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Aguada Clara, camino s/n', 'Coyhaique', 'Chile', -45.5787, -72.0697, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/300/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/301/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/302/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/303/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/304/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Aguada Clara 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Aguada Clara 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003fe-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Horizonte Sur Vichuquén', 'camping-horizonte-sur-vichuquen-tent-22', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Horizonte Sur, camino s/n', 'Vichuquén', 'Chile', -34.85, -72.0167, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/305/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/306/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/307/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/308/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/309/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Horizonte Sur 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Horizonte Sur 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '000003ff-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Paso del Indio Tongoy', 'camping-paso-del-indio-tongoy-tent-23', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Paso del Indio, camino s/n', 'Tongoy', 'Chile', -30.2548, -71.4909, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/310/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/311/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/312/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/313/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/314/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Paso del Indio 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Paso del Indio 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000400-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping Camino de Sombra Caburgua', 'camping-camino-de-sombra-caburgua-tent-24', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Camino de Sombra, camino s/n', 'Caburgua', 'Chile', -39.1597, -71.7763, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/315/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/316/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/317/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/318/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/319/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Camino de Sombra 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Camino de Sombra 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000401-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Orillas del Laja Peñuelas', 'camping-orillas-del-laja-penuelas-tent-25', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Orillas del Laja, camino s/n', 'Peñuelas', 'Chile', -32.9395, -71.2062, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/320/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/321/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/322/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/323/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/324/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Orillas del Laja 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Orillas del Laja 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000402-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping El Remanso Futaleufú', 'camping-el-remanso-futaleufu-tent-26', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector El Remanso, camino s/n', 'Futaleufú', 'Chile', -43.1693, -71.8527, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/325/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/326/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/327/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/328/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/329/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Remanso 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela El Remanso 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000403-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Siete Lagos Licán Ray', 'camping-siete-lagos-lican-ray-tent-27', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Siete Lagos, camino s/n', 'Licán Ray', 'Chile', -39.4992, -72.1325, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/330/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/331/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/332/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/333/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/334/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Siete Lagos 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Siete Lagos 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000404-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping La Junta Matanzas', 'camping-la-junta-matanzas-tent-28', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector La Junta, camino s/n', 'Matanzas', 'Chile', -33.979, -71.8457, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/335/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/336/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/337/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/338/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/339/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela La Junta 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela La Junta 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000405-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Piedra del Águila Chaitén', 'camping-piedra-del-aguila-chaiten-tent-29', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Piedra del Águila, camino s/n', 'Chaitén', 'Chile', -42.8922, -72.6922, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/340/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/341/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/342/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/343/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/344/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Piedra del Águila 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Piedra del Águila 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000406-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Arroyo Frío Río Hurtado', 'camping-arroyo-frio-rio-hurtado-tent-30', 'Parcelas naturales con fogón y áreas verdes. Ideal para familias y grupos aventureros que buscan conexión con la naturaleza en uno de los paisajes más increíbles de Chile.', 'Sector Arroyo Frío, camino s/n', 'Río Hurtado', 'Chile', -30.472, -70.8387, 'No fogatas después de las 23:00. Mascotas con correa. Silencio nocturno. Basura clasificada obligatoria.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/345/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/346/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/347/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/348/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/349/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Arroyo Frío 1', 'tent', 4, 8000, '["Fogón","Agua potable","Baños compartidos","Duchas"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Parcela Arroyo Frío 2', 'tent', 4, 7000, '["Fogón","Agua potable","Baños compartidos"]', 'Segunda unidad disponible.', 'active');

-- Tipo: cabin
v_cid := '00000407-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Los Pinos Pucón', 'camping-los-pinos-pucon-cabin-1', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Los Pinos, camino s/n', 'Pucón', 'Chile', -39.2959, -72.0002, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/350/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/351/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/352/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/353/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/354/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Los Pinos 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Los Pinos 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000408-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Lago Azul Puerto Varas', 'camping-lago-azul-puerto-varas-cabin-2', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Lago Azul, camino s/n', 'Puerto Varas', 'Chile', -41.3397, -73.007, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/355/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/356/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/357/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/358/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/359/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Lago Azul 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Lago Azul 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000409-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Del Bosque San José de Maipo', 'camping-del-bosque-san-jose-de-maipo-cabin-3', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Del Bosque, camino s/n', 'San José de Maipo', 'Chile', -33.6569, -70.3693, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/360/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/361/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/362/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/363/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/364/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Del Bosque 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Del Bosque 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000040a-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping El Rancho Cajón del Maipo', 'camping-el-rancho-cajon-del-maipo-cabin-4', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector El Rancho, camino s/n', 'Cajón del Maipo', 'Chile', -33.7963, -70.0963, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/365/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/366/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/367/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/368/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/369/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Rancho 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Rancho 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000040b-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Patagonia Puerto Natales', 'camping-patagonia-puerto-natales-cabin-5', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Patagonia, camino s/n', 'Puerto Natales', 'Chile', -51.7428, -72.5095, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/370/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/371/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/372/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/373/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/374/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Patagonia 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Patagonia 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000040c-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Las Araucarias San Pedro de Atacama', 'camping-las-araucarias-san-pedro-de-atacama-cabin-6', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Las Araucarias, camino s/n', 'San Pedro de Atacama', 'Chile', -22.9147, -68.2057, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/375/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/376/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/377/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/378/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/379/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Las Araucarias 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Las Araucarias 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000040d-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Vista Mar Villarrica', 'camping-vista-mar-villarrica-cabin-7', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Vista Mar, camino s/n', 'Villarrica', 'Chile', -39.2842, -72.2336, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/380/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/381/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/382/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/383/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/384/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Vista Mar 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Vista Mar 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000040e-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Montaña Mágica Ancud', 'camping-montana-magica-ancud-cabin-8', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Montaña Mágica, camino s/n', 'Ancud', 'Chile', -41.869, -73.829, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/385/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/386/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/387/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/388/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/389/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Montaña Mágica 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Montaña Mágica 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000040f-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Quilanto Maitencillo', 'camping-quilanto-maitencillo-cabin-9', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Quilanto, camino s/n', 'Maitencillo', 'Chile', -32.6455, -71.4788, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/390/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/391/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/392/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/393/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/394/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Quilanto 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Quilanto 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000410-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Piedra Roja Curacautín', 'camping-piedra-roja-curacautin-cabin-10', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Piedra Roja, camino s/n', 'Curacautín', 'Chile', -38.4253, -71.8753, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/395/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/396/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/397/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/398/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/399/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Piedra Roja 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Piedra Roja 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000411-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Las Lengas Cochrane', 'camping-las-lengas-cochrane-cabin-11', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Las Lengas, camino s/n', 'Cochrane', 'Chile', -47.2385, -72.5718, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/400/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/401/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/402/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/403/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/404/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Las Lengas 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Las Lengas 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000412-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping El Arrayán La Serena', 'camping-el-arrayan-la-serena-cabin-12', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector El Arrayán, camino s/n', 'La Serena', 'Chile', -29.8877, -71.2369, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/405/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/406/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/407/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/408/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/409/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Arrayán 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Arrayán 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000413-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Tres Ríos Termas de Chillán', 'camping-tres-rios-termas-de-chillan-cabin-13', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Tres Ríos, camino s/n', 'Termas de Chillán', 'Chile', -36.8898, -71.4148, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/410/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/411/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/412/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/413/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/414/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Tres Ríos 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Tres Ríos 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000414-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping La Hacienda Frutillar', 'camping-la-hacienda-frutillar-cabin-14', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector La Hacienda, camino s/n', 'Frutillar', 'Chile', -41.1077, -73.0336, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/415/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/416/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/417/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/418/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/419/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Hacienda 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Hacienda 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000415-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Bosque Encantado Torres del Paine', 'camping-bosque-encantado-torres-del-paine-cabin-15', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Bosque Encantado, camino s/n', 'Torres del Paine', 'Chile', -51.0245, -73.0245, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/420/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/421/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/422/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/423/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/424/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Bosque Encantado 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Bosque Encantado 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000416-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Piedra del Sol Olmué', 'camping-piedra-del-sol-olmue-cabin-16', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Piedra del Sol, camino s/n', 'Olmué', 'Chile', -33.021, -71.2043, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/425/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/426/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/427/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/428/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/429/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Piedra del Sol 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Piedra del Sol 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000417-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping La Roca Santa Cruz', 'camping-la-roca-santa-cruz-cabin-17', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector La Roca, camino s/n', 'Santa Cruz', 'Chile', -34.6532, -71.3811, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/430/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/431/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/432/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/433/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/434/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Roca 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Roca 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000418-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Cielos Abiertos Constitución', 'camping-cielos-abiertos-constitucion-cabin-18', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Cielos Abiertos, camino s/n', 'Constitución', 'Chile', -35.3473, -72.4307, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/435/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/436/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/437/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/438/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/439/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Cielos Abiertos 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Cielos Abiertos 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000419-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping El Mirador Zapallar', 'camping-el-mirador-zapallar-cabin-19', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector El Mirador, camino s/n', 'Zapallar', 'Chile', -32.5651, -71.4701, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/440/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/441/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/442/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/443/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/444/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Mirador 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Mirador 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000041a-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Valle de Niebla Lago Ranco', 'camping-valle-de-niebla-lago-ranco-cabin-20', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Valle de Niebla, camino s/n', 'Lago Ranco', 'Chile', -40.257, -72.5903, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/445/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/446/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/447/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/448/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/449/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Valle de Niebla 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Valle de Niebla 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000041b-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Las Quinchas Coyhaique', 'camping-las-quinchas-coyhaique-cabin-21', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Las Quinchas, camino s/n', 'Coyhaique', 'Chile', -45.5787, -72.0697, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/450/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/451/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/452/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/453/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/454/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Las Quinchas 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Las Quinchas 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000041c-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Raíces del Sur Vichuquén', 'camping-raices-del-sur-vichuquen-cabin-22', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Raíces del Sur, camino s/n', 'Vichuquén', 'Chile', -34.85, -72.0167, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/455/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/456/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/457/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/458/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/459/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Raíces del Sur 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Raíces del Sur 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000041d-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping La Cascada Tongoy', 'camping-la-cascada-tongoy-cabin-23', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector La Cascada, camino s/n', 'Tongoy', 'Chile', -30.2548, -71.4909, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/460/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/461/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/462/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/463/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/464/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Cascada 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Cascada 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000041e-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping Ruca del Bosque Caburgua', 'camping-ruca-del-bosque-caburgua-cabin-24', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Ruca del Bosque, camino s/n', 'Caburgua', 'Chile', -39.1597, -71.7763, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/465/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/466/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/467/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/468/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/469/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Ruca del Bosque 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Ruca del Bosque 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000041f-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping La Guarida Peñuelas', 'camping-la-guarida-penuelas-cabin-25', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector La Guarida, camino s/n', 'Peñuelas', 'Chile', -32.9395, -71.2062, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/470/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/471/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/472/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/473/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/474/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Guarida 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña La Guarida 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000420-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping El Alerce Futaleufú', 'camping-el-alerce-futaleufu-cabin-26', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector El Alerce, camino s/n', 'Futaleufú', 'Chile', -43.1693, -71.8527, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/475/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/476/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/477/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/478/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/479/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Alerce 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña El Alerce 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000421-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Viento Norte Licán Ray', 'camping-viento-norte-lican-ray-cabin-27', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Viento Norte, camino s/n', 'Licán Ray', 'Chile', -39.4992, -72.1325, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/480/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/481/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/482/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/483/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/484/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Viento Norte 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Viento Norte 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000422-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Nido de Cóndor Matanzas', 'camping-nido-de-condor-matanzas-cabin-28', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Nido de Cóndor, camino s/n', 'Matanzas', 'Chile', -33.979, -71.8457, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/485/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/486/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/487/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/488/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/489/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Nido de Cóndor 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Nido de Cóndor 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000423-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Alto Villarrica Chaitén', 'camping-alto-villarrica-chaiten-cabin-29', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Alto Villarrica, camino s/n', 'Chaitén', 'Chile', -42.8922, -72.6922, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/490/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/491/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/492/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/493/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/494/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Alto Villarrica 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Alto Villarrica 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000424-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Sendero Rojo Río Hurtado', 'camping-sendero-rojo-rio-hurtado-cabin-30', 'Cómodas cabañas de madera con todos los servicios. Perfectas para desconectarse sin renunciar al confort en medio de la naturaleza del sur de Chile.', 'Sector Sendero Rojo, camino s/n', 'Río Hurtado', 'Chile', -30.472, -70.8387, 'No fumar dentro. Check-in 15:00, Check-out 12:00. Mascotas en consulta previa.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/495/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/496/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/497/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/498/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/499/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Sendero Rojo 1', 'cabin', 6, 45000, '["Cocina equipada","Calefacción","WiFi","Ropa de cama"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Cabaña Sendero Rojo 2', 'cabin', 6, 41000, '["Cocina equipada","Calefacción","WiFi"]', 'Segunda unidad disponible.', 'active');

-- Tipo: glamping
v_cid := '00000425-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Estrellas Pucón', 'camping-estrellas-pucon-glamping-1', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Estrellas, camino s/n', 'Pucón', 'Chile', -39.2959, -72.0002, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/500/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/501/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/502/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/503/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/504/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Estrellas 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Estrellas 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000426-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Safari Puerto Varas', 'camping-safari-puerto-varas-glamping-2', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Safari, camino s/n', 'Puerto Varas', 'Chile', -41.3397, -73.007, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/505/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/506/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/507/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/508/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/509/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Safari 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Safari 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000427-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Cúpula del Cielo San José de Maipo', 'camping-cupula-del-cielo-san-jose-de-maipo-glamping-3', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Cúpula del Cielo, camino s/n', 'San José de Maipo', 'Chile', -33.6569, -70.3693, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/510/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/511/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/512/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/513/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/514/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Cúpula del Cielo 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Cúpula del Cielo 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000428-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping Jardín Secreto Cajón del Maipo', 'camping-jardin-secreto-cajon-del-maipo-glamping-4', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Jardín Secreto, camino s/n', 'Cajón del Maipo', 'Chile', -33.7963, -70.0963, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/515/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/516/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/517/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/518/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/519/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Jardín Secreto 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Jardín Secreto 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000429-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Árbol Eterno Puerto Natales', 'camping-arbol-eterno-puerto-natales-glamping-5', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Árbol Eterno, camino s/n', 'Puerto Natales', 'Chile', -51.7428, -72.5095, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/520/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/521/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/522/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/523/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/524/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Árbol Eterno 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Árbol Eterno 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000042a-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Burbujas San Pedro de Atacama', 'camping-burbujas-san-pedro-de-atacama-glamping-6', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Burbujas, camino s/n', 'San Pedro de Atacama', 'Chile', -22.9147, -68.2057, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/525/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/526/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/527/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/528/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/529/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Burbujas 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Burbujas 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000042b-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Nido de Águila Villarrica', 'camping-nido-de-aguila-villarrica-glamping-7', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Nido de Águila, camino s/n', 'Villarrica', 'Chile', -39.2842, -72.2336, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/530/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/531/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/532/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/533/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/534/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Nido de Águila 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Nido de Águila 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000042c-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Tierra Viva Ancud', 'camping-tierra-viva-ancud-glamping-8', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Tierra Viva, camino s/n', 'Ancud', 'Chile', -41.869, -73.829, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/535/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/536/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/537/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/538/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/539/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Tierra Viva 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Tierra Viva 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000042d-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Las Nubes Maitencillo', 'camping-las-nubes-maitencillo-glamping-9', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Las Nubes, camino s/n', 'Maitencillo', 'Chile', -32.6455, -71.4788, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/540/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/541/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/542/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/543/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/544/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Las Nubes 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Las Nubes 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000042e-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping El Oasis Curacautín', 'camping-el-oasis-curacautin-glamping-10', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector El Oasis, camino s/n', 'Curacautín', 'Chile', -38.4253, -71.8753, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/545/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/546/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/547/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/548/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/549/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Oasis 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Oasis 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000042f-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Refugio Lunar Cochrane', 'camping-refugio-lunar-cochrane-glamping-11', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Refugio Lunar, camino s/n', 'Cochrane', 'Chile', -47.2385, -72.5718, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/550/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/551/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/552/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/553/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/554/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Refugio Lunar 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Refugio Lunar 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000430-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Domo Austral La Serena', 'camping-domo-austral-la-serena-glamping-12', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Domo Austral, camino s/n', 'La Serena', 'Chile', -29.8877, -71.2369, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/555/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/556/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/557/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/558/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/559/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Domo Austral 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Domo Austral 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000431-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping El Pabellón Termas de Chillán', 'camping-el-pabellon-termas-de-chillan-glamping-13', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector El Pabellón, camino s/n', 'Termas de Chillán', 'Chile', -36.8898, -71.4148, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/560/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/561/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/562/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/563/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/564/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Pabellón 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Pabellón 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000432-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping Nube Blanca Frutillar', 'camping-nube-blanca-frutillar-glamping-14', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Nube Blanca, camino s/n', 'Frutillar', 'Chile', -41.1077, -73.0336, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/565/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/566/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/567/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/568/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/569/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Nube Blanca 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Nube Blanca 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000433-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Las Esferas Torres del Paine', 'camping-las-esferas-torres-del-paine-glamping-15', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Las Esferas, camino s/n', 'Torres del Paine', 'Chile', -51.0245, -73.0245, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/570/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/571/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/572/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/573/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/574/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Las Esferas 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Las Esferas 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000434-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Horizonte Mágico Olmué', 'camping-horizonte-magico-olmue-glamping-16', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Horizonte Mágico, camino s/n', 'Olmué', 'Chile', -33.021, -71.2043, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/575/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/576/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/577/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/578/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/579/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Horizonte Mágico 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Horizonte Mágico 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000435-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping El Santuario Santa Cruz', 'camping-el-santuario-santa-cruz-glamping-17', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector El Santuario, camino s/n', 'Santa Cruz', 'Chile', -34.6532, -71.3811, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/580/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/581/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/582/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/583/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/584/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Santuario 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Santuario 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000436-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping La Capsula Constitución', 'camping-la-capsula-constitucion-glamping-18', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector La Capsula, camino s/n', 'Constitución', 'Chile', -35.3473, -72.4307, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/585/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/586/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/587/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/588/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/589/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium La Capsula 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium La Capsula 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000437-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Éter Zapallar', 'camping-eter-zapallar-glamping-19', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Éter, camino s/n', 'Zapallar', 'Chile', -32.5651, -71.4701, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/590/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/591/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/592/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/593/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/594/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Éter 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Éter 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000438-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Cosmos Lago Ranco', 'camping-cosmos-lago-ranco-glamping-20', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Cosmos, camino s/n', 'Lago Ranco', 'Chile', -40.257, -72.5903, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/595/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/596/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/597/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/598/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/599/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Cosmos 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Cosmos 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000439-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Aurora Coyhaique', 'camping-aurora-coyhaique-glamping-21', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Aurora, camino s/n', 'Coyhaique', 'Chile', -45.5787, -72.0697, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/600/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/601/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/602/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/603/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/604/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Aurora 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Aurora 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000043a-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Bruma Vichuquén', 'camping-bruma-vichuquen-glamping-22', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Bruma, camino s/n', 'Vichuquén', 'Chile', -34.85, -72.0167, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/605/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/606/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/607/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/608/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/609/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Bruma 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Bruma 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000043b-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Silencio Vivo Tongoy', 'camping-silencio-vivo-tongoy-glamping-23', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Silencio Vivo, camino s/n', 'Tongoy', 'Chile', -30.2548, -71.4909, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/610/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/611/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/612/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/613/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/614/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Silencio Vivo 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Silencio Vivo 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000043c-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping El Portal Caburgua', 'camping-el-portal-caburgua-glamping-24', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector El Portal, camino s/n', 'Caburgua', 'Chile', -39.1597, -71.7763, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/615/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/616/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/617/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/618/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/619/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Portal 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Portal 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000043d-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Umbral Verde Peñuelas', 'camping-umbral-verde-penuelas-glamping-25', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Umbral Verde, camino s/n', 'Peñuelas', 'Chile', -32.9395, -71.2062, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/620/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/621/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/622/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/623/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/624/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Umbral Verde 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Umbral Verde 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000043e-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Nido Estelar Futaleufú', 'camping-nido-estelar-futaleufu-glamping-26', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Nido Estelar, camino s/n', 'Futaleufú', 'Chile', -43.1693, -71.8527, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/625/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/626/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/627/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/628/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/629/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Nido Estelar 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Nido Estelar 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000043f-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping La Ensoñación Licán Ray', 'camping-la-ensonacion-lican-ray-glamping-27', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector La Ensoñación, camino s/n', 'Licán Ray', 'Chile', -39.4992, -72.1325, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/630/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/631/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/632/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/633/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/634/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium La Ensoñación 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium La Ensoñación 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000440-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Éxtasis Natural Matanzas', 'camping-extasis-natural-matanzas-glamping-28', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Éxtasis Natural, camino s/n', 'Matanzas', 'Chile', -33.979, -71.8457, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/635/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/636/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/637/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/638/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/639/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Éxtasis Natural 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Éxtasis Natural 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000441-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping El Origen Chaitén', 'camping-el-origen-chaiten-glamping-29', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector El Origen, camino s/n', 'Chaitén', 'Chile', -42.8922, -72.6922, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/640/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/641/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/642/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/643/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/644/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Origen 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium El Origen 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000442-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Tierra Alta Río Hurtado', 'camping-tierra-alta-rio-hurtado-glamping-30', 'Experiencia de lujo en plena naturaleza. Camas premium, servicio personalizado y vistas inigualables para una estadía única e irrepetible.', 'Sector Tierra Alta, camino s/n', 'Río Hurtado', 'Chile', -30.472, -70.8387, 'Solo adultos. Reserva con 48h de anticipación. Mínimo 2 noches en temporada alta.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/645/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/646/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/647/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/648/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/649/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Tierra Alta 1', 'glamping', 2, 80000, '["Cama king","Desayuno incluido","WiFi","Calefacción"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Domo Premium Tierra Alta 2', 'glamping', 2, 72000, '["Cama king","Desayuno incluido","WiFi"]', 'Segunda unidad disponible.', 'active');

-- Tipo: camper
v_cid := '00000443-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Ruta Sur Pucón', 'camping-ruta-sur-pucon-camper-1', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Ruta Sur, camino s/n', 'Pucón', 'Chile', -39.2959, -72.0002, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/650/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/651/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/652/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/653/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/654/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Ruta Sur 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Ruta Sur 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000444-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Camino Austral Puerto Varas', 'camping-camino-austral-puerto-varas-camper-2', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Camino Austral, camino s/n', 'Puerto Varas', 'Chile', -41.3397, -73.007, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/655/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/656/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/657/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/658/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/659/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Camino Austral 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Camino Austral 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000445-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Costa Libre San José de Maipo', 'camping-costa-libre-san-jose-de-maipo-camper-3', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Costa Libre, camino s/n', 'San José de Maipo', 'Chile', -33.6569, -70.3693, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/660/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/661/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/662/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/663/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/664/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Costa Libre 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Costa Libre 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000446-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping Las Terrazas Cajón del Maipo', 'camping-las-terrazas-cajon-del-maipo-camper-4', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Las Terrazas, camino s/n', 'Cajón del Maipo', 'Chile', -33.7963, -70.0963, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/665/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/666/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/667/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/668/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/669/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Las Terrazas 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Las Terrazas 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000447-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Paso de Montaña Puerto Natales', 'camping-paso-de-montana-puerto-natales-camper-5', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Paso de Montaña, camino s/n', 'Puerto Natales', 'Chile', -51.7428, -72.5095, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/670/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/671/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/672/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/673/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/674/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Paso de Montaña 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Paso de Montaña 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000448-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Ruta del Vino San Pedro de Atacama', 'camping-ruta-del-vino-san-pedro-de-atacama-camper-6', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Ruta del Vino, camino s/n', 'San Pedro de Atacama', 'Chile', -22.9147, -68.2057, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/675/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/676/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/677/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/678/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/679/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Ruta del Vino 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Ruta del Vino 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000449-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Norte Grande Villarrica', 'camping-norte-grande-villarrica-camper-7', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Norte Grande, camino s/n', 'Villarrica', 'Chile', -39.2842, -72.2336, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/680/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/681/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/682/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/683/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/684/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Norte Grande 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Norte Grande 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000044a-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Lago Sur Ancud', 'camping-lago-sur-ancud-camper-8', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Lago Sur, camino s/n', 'Ancud', 'Chile', -41.869, -73.829, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/685/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/686/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/687/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/688/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/689/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Lago Sur 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Lago Sur 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000044b-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Valle Central Maitencillo', 'camping-valle-central-maitencillo-camper-9', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Valle Central, camino s/n', 'Maitencillo', 'Chile', -32.6455, -71.4788, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/690/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/691/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/692/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/693/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/694/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Valle Central 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Valle Central 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000044c-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Punta Extremo Curacautín', 'camping-punta-extremo-curacautin-camper-10', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Punta Extremo, camino s/n', 'Curacautín', 'Chile', -38.4253, -71.8753, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/695/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/696/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/697/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/698/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/699/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Punta Extremo 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Punta Extremo 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000044d-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Km 0 Sur Cochrane', 'camping-km-0-sur-cochrane-camper-11', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Km 0 Sur, camino s/n', 'Cochrane', 'Chile', -47.2385, -72.5718, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/700/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/701/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/702/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/703/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/704/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Km 0 Sur 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Km 0 Sur 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000044e-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Gasolinera Verde La Serena', 'camping-gasolinera-verde-la-serena-camper-12', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Gasolinera Verde, camino s/n', 'La Serena', 'Chile', -29.8877, -71.2369, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/705/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/706/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/707/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/708/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/709/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Gasolinera Verde 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Gasolinera Verde 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000044f-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Área de Descanso Termas de Chillán', 'camping-area-de-descanso-termas-de-chillan-camper-13', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Área de Descanso, camino s/n', 'Termas de Chillán', 'Chile', -36.8898, -71.4148, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/710/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/711/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/712/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/713/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/714/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Área de Descanso 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Área de Descanso 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000450-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping El Poste Frutillar', 'camping-el-poste-frutillar-camper-14', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector El Poste, camino s/n', 'Frutillar', 'Chile', -41.1077, -73.0336, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/715/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/716/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/717/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/718/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/719/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper El Poste 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper El Poste 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000451-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping Cruce del Viento Torres del Paine', 'camping-cruce-del-viento-torres-del-paine-camper-15', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Cruce del Viento, camino s/n', 'Torres del Paine', 'Chile', -51.0245, -73.0245, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/720/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/721/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/722/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/723/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/724/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Cruce del Viento 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Cruce del Viento 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000452-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping La Bifurcación Olmué', 'camping-la-bifurcacion-olmue-camper-16', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector La Bifurcación, camino s/n', 'Olmué', 'Chile', -33.021, -71.2043, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/725/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/726/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/727/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/728/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/729/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper La Bifurcación 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper La Bifurcación 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000453-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping Llave del Sur Santa Cruz', 'camping-llave-del-sur-santa-cruz-camper-17', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Llave del Sur, camino s/n', 'Santa Cruz', 'Chile', -34.6532, -71.3811, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/730/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/731/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/732/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/733/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/734/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Llave del Sur 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Llave del Sur 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000454-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Inicio Patagonia Constitución', 'camping-inicio-patagonia-constitucion-camper-18', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Inicio Patagonia, camino s/n', 'Constitución', 'Chile', -35.3473, -72.4307, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/735/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/736/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/737/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/738/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/739/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Inicio Patagonia 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Inicio Patagonia 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000455-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Punto Rojo Zapallar', 'camping-punto-rojo-zapallar-camper-19', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Punto Rojo, camino s/n', 'Zapallar', 'Chile', -32.5651, -71.4701, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/740/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/741/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/742/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/743/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/744/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Punto Rojo 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Punto Rojo 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000456-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Escala Austral Lago Ranco', 'camping-escala-austral-lago-ranco-camper-20', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Escala Austral, camino s/n', 'Lago Ranco', 'Chile', -40.257, -72.5903, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/745/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/746/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/747/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/748/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/749/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Escala Austral 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Escala Austral 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000457-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000002-0000-4000-8000-000000000000', 'Camping Ruta Costera Coyhaique', 'camping-ruta-costera-coyhaique-camper-21', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Ruta Costera, camino s/n', 'Coyhaique', 'Chile', -45.5787, -72.0697, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/750/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/751/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/752/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/753/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/754/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Ruta Costera 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Ruta Costera 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000458-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000003-0000-4000-8000-000000000000', 'Camping Freno en Curva Vichuquén', 'camping-freno-en-curva-vichuquen-camper-22', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Freno en Curva, camino s/n', 'Vichuquén', 'Chile', -34.85, -72.0167, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/755/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/756/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/757/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/758/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/759/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Freno en Curva 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Freno en Curva 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000459-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000004-0000-4000-8000-000000000000', 'Camping Mirador del Asfalto Tongoy', 'camping-mirador-del-asfalto-tongoy-camper-23', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Mirador del Asfalto, camino s/n', 'Tongoy', 'Chile', -30.2548, -71.4909, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/760/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/761/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/762/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/763/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/764/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Mirador del Asfalto 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Mirador del Asfalto 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000045a-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000005-0000-4000-8000-000000000000', 'Camping Las Señales Caburgua', 'camping-las-senales-caburgua-camper-24', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Las Señales, camino s/n', 'Caburgua', 'Chile', -39.1597, -71.7763, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/765/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/766/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/767/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/768/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/769/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Las Señales 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Las Señales 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000045b-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000006-0000-4000-8000-000000000000', 'Camping El Tapón Peñuelas', 'camping-el-tapon-penuelas-camper-25', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector El Tapón, camino s/n', 'Peñuelas', 'Chile', -32.9395, -71.2062, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/770/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/771/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/772/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/773/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/774/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper El Tapón 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper El Tapón 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000045c-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000007-0000-4000-8000-000000000000', 'Camping Velocidad Cero Futaleufú', 'camping-velocidad-cero-futaleufu-camper-26', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Velocidad Cero, camino s/n', 'Futaleufú', 'Chile', -43.1693, -71.8527, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/775/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/776/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/777/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/778/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/779/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Velocidad Cero 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Velocidad Cero 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000045d-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000008-0000-4000-8000-000000000000', 'Camping El Crucero Licán Ray', 'camping-el-crucero-lican-ray-camper-27', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector El Crucero, camino s/n', 'Licán Ray', 'Chile', -39.4992, -72.1325, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/780/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/781/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/782/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/783/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/784/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper El Crucero 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper El Crucero 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000045e-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '00000009-0000-4000-8000-000000000000', 'Camping Brújula Sur Matanzas', 'camping-brujula-sur-matanzas-camper-28', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Brújula Sur, camino s/n', 'Matanzas', 'Chile', -33.979, -71.8457, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/785/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/786/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/787/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/788/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/789/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Brújula Sur 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Brújula Sur 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '0000045f-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000a-0000-4000-8000-000000000000', 'Camping Carpa Rodante Chaitén', 'camping-carpa-rodante-chaiten-camper-29', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Carpa Rodante, camino s/n', 'Chaitén', 'Chile', -42.8922, -72.6922, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/790/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/791/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/792/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/793/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/794/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Carpa Rodante 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Carpa Rodante 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

v_cid := '00000460-0000-4000-8000-000000000000';
INSERT INTO public.campings (id, owner_id, name, slug, description, address, city, country, lat, lng, rules, status)
VALUES (v_cid, '0000000b-0000-4000-8000-000000000000', 'Camping Motor Apagado Río Hurtado', 'camping-motor-apagado-rio-hurtado-camper-30', 'Sitios amplios con electricidad 220V, agua potable y descarga de aguas grises. El punto de parada ideal en tu aventura por Chile.', 'Sector Motor Apagado, camino s/n', 'Río Hurtado', 'Chile', -30.472, -70.8387, 'Conexión eléctrica con cable propio. Descarga responsable de aguas grises. Ruido motor solo 8:00-22:00.', 'active')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/795/800/600', 0, true);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/796/800/600', 1, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/797/800/600', 2, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/798/800/600', 3, false);
INSERT INTO public.camping_images (camping_id, url, "order", is_cover)
VALUES (v_cid, 'https://picsum.photos/seed/799/800/600', 4, false);

INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Motor Apagado 1', 'camper', 4, 15000, '["Electricidad 220V","Agua potable","Descarga grises","Baños"]', 'Unidad principal con todas las comodidades.', 'active');
INSERT INTO public.units (camping_id, name, type, capacity, price_per_night, amenities, description, status)
VALUES (v_cid, 'Sitio Camper Motor Apagado 2', 'camper', 4, 14000, '["Electricidad 220V","Agua potable","Descarga grises"]', 'Segunda unidad disponible.', 'active');

END $$;

-- Verificar
SELECT count(*) AS campings FROM public.campings;
SELECT count(*) AS usuarios FROM public.profiles;
SELECT count(*) AS unidades FROM public.units;
