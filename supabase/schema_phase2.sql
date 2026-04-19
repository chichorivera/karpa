-- ============================================
-- KARPA — Fase 2: Campings, Unidades, Reservas
-- Ejecutar en Supabase SQL Editor
-- ============================================

-- Tipos
create type camping_status  as enum ('draft', 'active', 'paused');
create type unit_type       as enum ('tent', 'camper', 'cabin', 'glamping', 'other');
create type unit_status     as enum ('active', 'inactive');
create type booking_status  as enum ('pending', 'confirmed', 'cancelled', 'completed');
create type payment_status  as enum ('unpaid', 'paid', 'refunded');

-- Campings
create table campings (
  id          uuid primary key default gen_random_uuid(),
  owner_id    uuid not null references profiles(id) on delete cascade,
  name        text not null,
  slug        text not null unique,
  description text,
  address     text,
  city        text,
  country     text not null default 'Chile',
  lat         numeric(10,7),
  lng         numeric(10,7),
  rules       text,
  status      camping_status not null default 'draft',
  created_at  timestamptz not null default now()
);

-- Imágenes de camping
create table camping_images (
  id          uuid primary key default gen_random_uuid(),
  camping_id  uuid not null references campings(id) on delete cascade,
  url         text not null,
  "order"     int not null default 0,
  is_cover    boolean not null default false,
  created_at  timestamptz not null default now()
);

-- Unidades / Parcelas
create table units (
  id               uuid primary key default gen_random_uuid(),
  camping_id       uuid not null references campings(id) on delete cascade,
  name             text not null,
  type             unit_type not null default 'tent',
  capacity         int not null default 2,
  price_per_night  numeric(10,2) not null,
  amenities        jsonb not null default '[]',
  description      text,
  status           unit_status not null default 'active',
  created_at       timestamptz not null default now()
);

-- Fechas bloqueadas
create table blocked_dates (
  id          uuid primary key default gen_random_uuid(),
  unit_id     uuid not null references units(id) on delete cascade,
  date_from   date not null,
  date_to     date not null,
  reason      text,
  created_at  timestamptz not null default now()
);

-- Reservas
create table bookings (
  id              uuid primary key default gen_random_uuid(),
  unit_id         uuid not null references units(id),
  camping_id      uuid not null references campings(id),
  traveler_id     uuid not null references profiles(id),
  check_in        date not null,
  check_out       date not null,
  guests          int not null default 1,
  total_price     numeric(10,2) not null,
  status          booking_status not null default 'pending',
  payment_status  payment_status not null default 'unpaid',
  created_at      timestamptz not null default now()
);

-- Pagos Webpay
create table payments (
  id                   uuid primary key default gen_random_uuid(),
  booking_id           uuid not null references bookings(id),
  tbk_buy_order        text,
  tbk_session_id       text,
  tbk_transaction_id   text,
  authorization_code   text,
  amount               numeric(10,2) not null,
  status               text not null default 'pending',
  card_last_digits     text,
  payment_type         text,
  created_at           timestamptz not null default now()
);

-- Reseñas
create table reviews (
  id          uuid primary key default gen_random_uuid(),
  booking_id  uuid not null unique references bookings(id),
  traveler_id uuid not null references profiles(id),
  camping_id  uuid not null references campings(id),
  rating      int not null check (rating between 1 and 5),
  comment     text,
  created_at  timestamptz not null default now()
);

-- Mensajes
create table messages (
  id          uuid primary key default gen_random_uuid(),
  booking_id  uuid not null references bookings(id),
  sender_id   uuid not null references profiles(id),
  body        text not null,
  created_at  timestamptz not null default now()
);

-- ============================================
-- RLS Policies
-- ============================================

alter table campings       enable row level security;
alter table camping_images enable row level security;
alter table units          enable row level security;
alter table blocked_dates  enable row level security;
alter table bookings       enable row level security;
alter table payments       enable row level security;
alter table reviews        enable row level security;
alter table messages       enable row level security;

-- Campings: lectura pública de activos
create policy "campings publicos"
  on campings for select
  using (status = 'active');

-- Campings: host ve y gestiona los suyos
create policy "host gestiona sus campings"
  on campings for all
  using (owner_id = auth.uid());

-- Campings: admin ve todos
create policy "admin ve todos los campings"
  on campings for all
  using (exists (select 1 from profiles where id = auth.uid() and role = 'admin'));

-- Imágenes: lectura pública
create policy "imagenes publicas"
  on camping_images for select
  using (exists (select 1 from campings where id = camping_id and status = 'active'));

create policy "host gestiona imagenes"
  on camping_images for all
  using (exists (select 1 from campings where id = camping_id and owner_id = auth.uid()));

-- Unidades: lectura pública si camping activo
create policy "unidades publicas"
  on units for select
  using (
    status = 'active' and
    exists (select 1 from campings where id = camping_id and status = 'active')
  );

create policy "host gestiona unidades"
  on units for all
  using (exists (select 1 from campings where id = camping_id and owner_id = auth.uid()));

-- Blocked dates: host gestiona
create policy "host gestiona bloqueos"
  on blocked_dates for all
  using (exists (
    select 1 from units u
    join campings c on c.id = u.camping_id
    where u.id = unit_id and c.owner_id = auth.uid()
  ));

-- Bookings: viajero ve las suyas
create policy "viajero ve sus reservas"
  on bookings for select
  using (traveler_id = auth.uid());

-- Bookings: host ve reservas de sus campings
create policy "host ve reservas de sus campings"
  on bookings for select
  using (exists (select 1 from campings where id = camping_id and owner_id = auth.uid()));

-- Bookings: host puede actualizar estado
create policy "host actualiza estado reserva"
  on bookings for update
  using (exists (select 1 from campings where id = camping_id and owner_id = auth.uid()));

-- Bookings: viajero puede crear reserva
create policy "viajero crea reserva"
  on bookings for insert
  with check (traveler_id = auth.uid());

-- Bookings: viajero puede cancelar la suya
create policy "viajero cancela reserva"
  on bookings for update
  using (traveler_id = auth.uid());

-- Reseñas: lectura pública
create policy "resenas publicas"
  on reviews for select using (true);

create policy "viajero crea resena"
  on reviews for insert
  with check (traveler_id = auth.uid());

-- Mensajes: participantes de la reserva
create policy "mensajes de reserva"
  on messages for all
  using (
    sender_id = auth.uid() or
    exists (select 1 from bookings where id = booking_id and traveler_id = auth.uid()) or
    exists (
      select 1 from bookings b
      join campings c on c.id = b.camping_id
      where b.id = booking_id and c.owner_id = auth.uid()
    )
  );

-- Función: generar slug único
create or replace function generate_slug(name text)
returns text as $$
declare
  base_slug text;
  final_slug text;
  counter int := 0;
begin
  base_slug := lower(regexp_replace(
    translate(name, 'áéíóúÁÉÍÓÚñÑ', 'aeiouAEIOUnN'),
    '[^a-z0-9]+', '-', 'g'
  ));
  base_slug := trim(both '-' from base_slug);
  final_slug := base_slug;

  loop
    exit when not exists (select 1 from campings where slug = final_slug);
    counter := counter + 1;
    final_slug := base_slug || '-' || counter;
  end loop;

  return final_slug;
end;
$$ language plpgsql;
