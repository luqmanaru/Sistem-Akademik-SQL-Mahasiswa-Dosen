-- Data Jurusan
INSERT INTO jurusan (kode_jur, nama_jur) VALUES 
('TI', 'Teknik Informatika'),
('SI', 'Sistem Informasi'),
('TK', 'Teknik Komputer');

-- Data Mahasiswa
INSERT INTO mahasiswa (nim, nama_m, tpt_lhr_m, tgl_lhr_m, j_kelamin, alm_m, kota_m, agama_m, telepon_m, kode_jur) VALUES 
('101031001', 'Dewi Nurbaini', 'Bekasi', '1987-10-12', 'Wanita', 'Jl. Dahlia I Blok BC 2/3', 'Bekasi Utara', 'Hindu', '021-8791290', 'TI'),
('I01031003', 'Rini Hapsari', 'Bogor', '1980-08-18', 'Wanita', 'Jl. Cikarang Baru No.2', 'Cikarang', 'Islam', '021-8911122', 'TI');

-- Data Dosen
INSERT INTO dosen (nid, nama_d, alm_d, telepon_d, kode_jur) VALUES 
('D01', 'Prof. Ahmad Sanusi', 'Jl. Pendidikan No.1', '021-88112233', 'TI'),
('D02', 'Dr. Siti Aminah', 'Jl. Cendrawasih No.45', '021-8998877', 'SI');

-- Data Matakuliah
INSERT INTO matakuliah (kdmk, nama_mk, sks, semester) VALUES 
('MPK131201', 'Pancasila', 2, '1'),
('MKK231203', 'Matematika Diskrit I', 3, '1'),
('SIK332101', 'Basis Data', 3, '3');

-- Data Nilai
INSERT INTO nilai (nim, kdmk, smt, nid, nilai_absen, nilai_tugas, nilai_uts, nilai_uas) VALUES 
('101031001', 'MPK131201', '1', 'D02', 12, 78, 89, 55),
('I01031003', 'MKK231203', '1', 'D01', 15, 85, 75, 80);
