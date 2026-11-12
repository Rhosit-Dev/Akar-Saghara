# Panduan Pemasangan: Kartu Kenangan Mangrove

Isi folder:
- index.html : halaman peserta
- admin.html : galeri untuk tim PDD
- config.js  : tempat mengisi kunci Supabase
- setup.sql  : perintah untuk membuat tabel dan penyimpanan
- assets/template-mangrove.png : desain kartu transparan yang digunakan sebagai template

## 1. Buat project Supabase (gratis, tanpa kartu kredit)
1. Daftar di supabase.com, lalu pilih New project.
2. Isi nama project dan password database (simpan), pilih region terdekat (Singapore).
3. Tunggu sampai project selesai dibuat.

## 2. Siapkan database dan penyimpanan
1. Buka menu SQL Editor, pilih New query.
2. Salin seluruh isi setup.sql, tempel, lalu klik Run.
3. Pastikan muncul pesan sukses. Cek menu Storage: harus ada bucket bernama kartu.

## 3. Isi config.js
1. Buka Project Settings, lalu menu API (atau API Keys).
2. Salin Project URL ke SUPABASE_URL.
3. Salin anon key (atau publishable key) ke SUPABASE_KEY.
4. Ubah EVENT_NAME dan EVENT_SUB sesuai acara.

## 4. Pasang ke internet (Netlify)
1. Buka app.netlify.com/drop.
2. Seret seluruh folder ini ke halaman tersebut.
3. Catat alamat situs yang diberikan, misalnya https://nama-situs.netlify.app

## 5. Buat QR
Buat QR menggunakan layanan atau aplikasi pilihanmu setelah alamat situs final. QR yang berisi alamat utama situs akan membuka halaman peserta tanpa nomor pohon. Jika ingin nomor pohon tercatat di kartu, tambahkan parameter pada alamat, misalnya `https://nama-situs.netlify.app/?pohon=001`.

## 6. Uji sebelum acara
- Scan satu QR memakai HP, unggah foto, isi nama dan pesan, lalu simpan.
- Buka /admin.html dan pastikan kartunya muncul.
- Coba di iPhone dan Android, dengan sinyal yang lemah.

## Catatan penting
- Admin: admin.html tidak memakai password. Siapa pun yang tahu alamatnya bisa melihat galeri. Hapus kartu yang tidak pantas lewat Supabase (Table Editor untuk baris, Storage untuk file).
- Kuota gratis: penyimpanan 1 GB (kartu sekitar 300-600 KB, jadi cukup untuk ribuan kartu).
- Project Supabase gratis dijeda jika tidak aktif seminggu. Buka dashboard-nya beberapa hari sebelum acara.
- Foto peserta tersimpan dan tampil publik lewat tautan. Pastikan peserta diberi tahu (sudah ada kalimat persetujuan di form).
