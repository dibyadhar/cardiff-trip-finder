create table if not exists public.trip_list_items (
  id text primary key,
  text text not null check (char_length(text) between 1 and 120),
  category text not null check (category in ('Grocery', 'Packing', 'Booking', 'Activity', 'Other')),
  trip_date date,
  done boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.trip_list_items add column if not exists trip_date date;

alter table public.trip_list_items enable row level security;

grant select, insert, update, delete on public.trip_list_items to anon;

drop policy if exists "Trip list read" on public.trip_list_items;
create policy "Trip list read"
on public.trip_list_items for select
to anon
using (true);

drop policy if exists "Trip list add" on public.trip_list_items;
create policy "Trip list add"
on public.trip_list_items for insert
to anon
with check (true);

drop policy if exists "Trip list update" on public.trip_list_items;
create policy "Trip list update"
on public.trip_list_items for update
to anon
using (true)
with check (true);

drop policy if exists "Trip list delete" on public.trip_list_items;
create policy "Trip list delete"
on public.trip_list_items for delete
to anon
using (true);

do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'trip_list_items'
  ) then
    alter publication supabase_realtime add table public.trip_list_items;
  end if;
end
$$;
