-- Enable PostGIS extension for geolocation features (emap_services / bat_track_v1)
create extension if not exists "postgis";

-- 1. Table clients
create table public.clients (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  name text not null,
  email text not null,
  phone text,
  address text,
  company text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. Table chantiers
create table public.chantiers (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  client_id uuid references public.clients(id) on delete set null,
  status text default 'pending'::text,
  latitude double precision,
  longitude double precision,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 3. Table devis
create table public.devis (
  id uuid primary key default gen_random_uuid(),
  client_id uuid references public.clients(id) on delete cascade,
  chantier_id uuid references public.chantiers(id) on delete set null,
  service_type text not null, -- ex: plomberie, chauffage, climatisation
  details jsonb,
  amount decimal(12,2),
  status text default 'draft'::text, -- draft, sent, accepted, rejected
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 4. Table rendez_vous
create table public.rendez_vous (
  id uuid primary key default gen_random_uuid(),
  client_id uuid references public.clients(id) on delete cascade,
  chantier_id uuid references public.chantiers(id) on delete set null,
  scheduled_at timestamp with time zone not null,
  purpose text not null,
  status text default 'scheduled'::text, -- scheduled, completed, cancelled
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 5. Table messages (Chat)
create table public.messages (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid references auth.users(id) on delete cascade,
  recipient_id uuid references auth.users(id) on delete cascade,
  chantier_id uuid references public.chantiers(id) on delete set null,
  content text not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable Row Level Security (RLS)
alter table public.clients enable row level security;
alter table public.chantiers enable row level security;
alter table public.devis enable row level security;
alter table public.rendez_vous enable row level security;
alter table public.messages enable row level security;
