# Sistem-Akademik-SQL-Mahasiswa-Dosen
Repository ini berisi implementasi database untuk sistem informasi akademik sederhana yang mencakup manajemen mahasiswa, dosen, matakuliah, dan nilai.

---

## 📌 Fitur Utama
- Struktur database lengkap untuk sistem akademik
- Relasi antar tabel (mahasiswa, dosen, jurusan, matakuliah, nilai)
- Contoh data untuk pengujian

---

## 🛠️ Teknologi
- SQL (MySQL/PostgreSQL compatible)

---

## 📂 Struktur Database

### Tabel `jurusan`
| Kolom      | Tipe Data   | Deskripsi               |
|------------|-------------|-------------------------|
| kode_jur   | VARCHAR(2)  | Kode unik jurusan (PK)  |
| nama_jur   | VARCHAR(50) | Nama lengkap jurusan    |

### Tabel `mahasiswa`
| Kolom        | Tipe Data   | Deskripsi                     |
|--------------|-------------|-------------------------------|
| nim          | VARCHAR(10) | NIM mahasiswa (PK)            |
| nama_m       | VARCHAR(50) | Nama lengkap mahasiswa        |
| tpt_lhr_m    | VARCHAR(20) | Tempat lahir                  |
| tgl_lhr_m    | DATE        | Tanggal lahir                 |
| j_kelamin    | VARCHAR(10) | Jenis kelamin                 |
| alm_m        | VARCHAR(100)| Alamat lengkap                |
| kota_m       | VARCHAR(20) | Kota domisili                 |
| agama_m      | VARCHAR(10) | Agama                         |
| telepon_m    | VARCHAR(20) | Nomor telepon                 |
| kode_jur     | VARCHAR(2)  | Foreign Key ke tabel jurusan  |

### Tabel `nilai`
| Kolom         | Tipe Data   | Deskripsi                     |
|---------------|-------------|-------------------------------|
| nim           | VARCHAR(10) | Foreign Key ke mahasiswa      |
| kdmk          | VARCHAR(10) | Foreign Key ke matakuliah     |
| smt           | VARCHAR(2)  | Semester                      |
| nid           | VARCHAR(3)  | Foreign Key ke dosen          |
| nilai_absen   | INT         | Nilai absen (0-100)           |
| nilai_tugas   | INT         | Nilai tugas (0-100)           |
| nilai_uts     | INT         | Nilai UTS (0-100)             |
| nilai_uas     | INT         | Nilai UAS (0-100)             |

---

## 🔧 Cara Menggunakan
1. Eksekusi file `create_tables.sql` untuk membuat struktur database
2. Jalankan `sample_data.sql` untuk mengisi data contoh
3. Gunakan `queries.sql` untuk contoh query yang berguna

---

**luqmanaru**
