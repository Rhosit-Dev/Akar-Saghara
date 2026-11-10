-- Jalankan sekali di Supabase: menu SQL Editor -> New query -> tempel -> Run

-- 1) Tabel kenangan
create table if not exists public.kenangan (
  id uuid primary key default gen_random_uuid(),
  pohon text not null,
  nama text not null,
  pesan text not null,
  kartu_url text not null,
  created_at timestamptz not null default now()
);

alter table public.kenangan enable row level security;

-- Peserta (anon) boleh kirim, dengan batas panjang teks
create policy "peserta boleh kirim" on public.kenangan
  for insert to anon
  with check (char_length(nama) <= 60 and char_length(pesan) <= 200);

-- Halaman galeri boleh membaca
create policy "galeri boleh baca" on public.kenangan
  for select to anon using (true);

-- 2) Bucket penyimpanan kartu (publik, maks 5 MB, hanya JPEG)
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('kartu', 'kartu', true, 5242880, array['image/jpeg'])
on conflict (id) do nothing;

create policy "peserta boleh unggah kartu" on storage.objects
  for insert to anon
  with check (bucket_id = 'kartu');
