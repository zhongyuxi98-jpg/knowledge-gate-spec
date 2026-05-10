-- Knowledge Gate · Initial Supabase Schema
-- Status: Draft v0.1
-- Aligned with /00-charter/data-charter.md visibility tiers:
--   Public / Contributor / Owner / Admin
-- Run this in Supabase SQL editor after creating a new project.

-- ============================================================
-- 0. Extensions
-- ============================================================
create extension if not exists "uuid-ossp";
create extension if not exists "pgcrypto";

-- ============================================================
-- 1. Roles enum (logical, mapped to Supabase auth)
-- ============================================================
do $$ begin
  create type kg_role as enum ('visitor','contributor','owner','admin');
exception when duplicate_object then null; end $$;

do $$ begin
  create type kg_visibility as enum ('public','contributor','owner','admin');
exception when duplicate_object then null; end $$;

-- ============================================================
-- 2. Profiles (one row per auth.users)
-- ============================================================
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null,
  role kg_role not null default 'visitor',
  bio text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ============================================================
-- 3. Gateways registry (mirrors /01-architecture/gateways-registry.md)
-- ============================================================
create table if not exists public.gateways (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  name text not null,
  subject text,
  status text not null default 'draft',  -- draft | active | archived
  lovable_project_id text,
  visibility kg_visibility not null default 'public',
  created_at timestamptz not null default now()
);

-- ============================================================
-- 4. Lesson plans
-- ============================================================
create table if not exists public.lesson_plans (
  id uuid primary key default uuid_generate_v4(),
  gateway_id uuid references public.gateways(id) on delete set null,
  author_id uuid references public.profiles(id) on delete set null,
  title text not null,
  body_md text not null,
  status text not null default 'draft',   -- draft | review | published
  visibility kg_visibility not null default 'contributor',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ============================================================
-- 5. Reputation events (append-only)
-- ============================================================
create table if not exists public.reputation_events (
  id uuid primary key default uuid_generate_v4(),
  subject_id uuid not null references public.profiles(id) on delete cascade,
  kind text not null,           -- 'review_accepted' | 'lesson_published' | ...
  delta int not null,
  reason text,
  created_at timestamptz not null default now()
);

-- ============================================================
-- 6. Audit log (Admin-only)
-- ============================================================
create table if not exists public.audit_log (
  id uuid primary key default uuid_generate_v4(),
  actor_id uuid references public.profiles(id) on delete set null,
  action text not null,
  target text,
  payload jsonb,
  created_at timestamptz not null default now()
);

-- ============================================================
-- 7. Helper: current role
-- ============================================================
create or replace function public.current_kg_role() returns kg_role
language sql stable as $$
  select coalesce(
    (select role from public.profiles where id = auth.uid()),
    'visitor'::kg_role
  );
$$;

-- ============================================================
-- 8. Row Level Security
-- ============================================================
alter table public.profiles          enable row level security;
alter table public.gateways          enable row level security;
alter table public.lesson_plans      enable row level security;
alter table public.reputation_events enable row level security;
alter table public.audit_log         enable row level security;

-- profiles: anyone can read display_name; owner/admin can update self
drop policy if exists profiles_read on public.profiles;
create policy profiles_read on public.profiles
  for select using (true);

drop policy if exists profiles_self_update on public.profiles;
create policy profiles_self_update on public.profiles
  for update using (id = auth.uid());

-- gateways: public visible to all; others by role
drop policy if exists gateways_read on public.gateways;
create policy gateways_read on public.gateways
  for select using (
    visibility = 'public'
    or (visibility = 'contributor' and public.current_kg_role() in ('contributor','owner','admin'))
    or (visibility = 'admin' and public.current_kg_role() = 'admin')
  );

-- lesson_plans: respect visibility tier
drop policy if exists lesson_plans_read on public.lesson_plans;
create policy lesson_plans_read on public.lesson_plans
  for select using (
    (visibility = 'public' and status = 'published')
    or (visibility = 'contributor' and public.current_kg_role() in ('contributor','owner','admin'))
    or (visibility = 'owner' and author_id = auth.uid())
    or public.current_kg_role() = 'admin'
  );

drop policy if exists lesson_plans_author_write on public.lesson_plans;
create policy lesson_plans_author_write on public.lesson_plans
  for all using (author_id = auth.uid() or public.current_kg_role() = 'admin')
  with check (author_id = auth.uid() or public.current_kg_role() = 'admin');

-- reputation_events: subject can read own; admin can read all
drop policy if exists rep_read on public.reputation_events;
create policy rep_read on public.reputation_events
  for select using (subject_id = auth.uid() or public.current_kg_role() = 'admin');

-- audit_log: admin only
drop policy if exists audit_admin on public.audit_log;
create policy audit_admin on public.audit_log
  for select using (public.current_kg_role() = 'admin');

-- ============================================================
-- 9. Notes
-- ============================================================
-- • Insert/update/delete on gateways and audit_log are admin-only by default
--   (no permissive policies created here → RLS denies).
-- • Tighten further when the Council ratifies governance.md v1.0.
