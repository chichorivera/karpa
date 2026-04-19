-- ============================================
-- KARPA — Schema inicial
-- Ejecutar en Supabase SQL Editor
-- ============================================

-- Tipos
create type user_role as enum ('admin', 'host', 'traveler');

-- Tabla profiles (extiende auth.users)
create table profiles (
  id          uuid primary key references auth.users(id) on delete cascade,
  role        user_role not null default 'traveler',
  full_name   text,
  avatar_url  text,
  phone       text,
  created_at  timestamptz not null default now()
);

-- Crear perfil automáticamente al registrarse
create or replace function handle_new_user()
returns trigger as $$
begin
  insert into profiles (id, full_name)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'full_name', '')
  );
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure handle_new_user();

-- RLS
alter table profiles enable row level security;

-- Cada usuario solo ve y edita su propio perfil
create policy "perfil propio lectura"
  on profiles for select
  using (auth.uid() = id);

create policy "perfil propio edicion"
  on profiles for update
  using (auth.uid() = id);

-- Admin puede ver todos los perfiles
create policy "admin lectura total"
  on profiles for select
  using (
    exists (
      select 1 from profiles
      where id = auth.uid() and role = 'admin'
    )
  );
