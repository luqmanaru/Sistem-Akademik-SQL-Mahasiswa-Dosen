-- 1. Query dasar menampilkan semua data
SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM jurusan;
SELECT * FROM matakuliah;
SELECT * FROM nilai;

-- 2. Menampilkan mahasiswa beserta nama jurusannya
SELECT m.nim, m.nama_m, j.nama_jur 
FROM mahasiswa m
JOIN jurusan j ON m.kode_jur = j.kode_jur;

-- 3. Menampilkan mata kuliah yang diambil oleh mahasiswa tertentu
SELECT m.nama_m, mk.nama_mk, n.nilai_uas
FROM nilai n
JOIN mahasiswa m ON n.nim = m.nim
JOIN matakuliah mk ON n.kdmk = mk.kdmk
WHERE m.nim = '101031001';

-- 4. Menghitung IPK mahasiswa (contoh untuk 1 mahasiswa)
SELECT m.nim, m.nama_m, 
       ROUND(SUM((n.nilai_absen*0.1 + n.nilai_tugas*0.2 + n.nilai_uts*0.3 + n.nilai_uas*0.4) * mk.sks) / SUM(mk.sks), 2) AS ipk
FROM nilai n
JOIN mahasiswa m ON n.nim = m.nim
JOIN matakuliah mk ON n.kdmk = mk.kdmk
WHERE m.nim = '101031001'
GROUP BY m.nim, m.nama_m;

-- 5. Menampilkan dosen pengampu mata kuliah
SELECT mk.nama_mk, d.nama_d 
FROM nilai n
JOIN dosen d ON n.nid = d.nid
JOIN matakuliah mk ON n.kdmk = mk.kdmk
GROUP BY mk.nama_mk, d.nama_d;

-- 6. Mencari mahasiswa berdasarkan nama (case insensitive)
SELECT * FROM mahasiswa 
WHERE LOWER(nama_m) LIKE LOWER('%nur%');

-- 7. Menampilkan jumlah mahasiswa per jurusan
SELECT j.nama_jur, COUNT(m.nim) AS jumlah_mahasiswa
FROM jurusan j
LEFT JOIN mahasiswa m ON j.kode_jur = m.kode_jur
GROUP BY j.nama_jur;

-- 8. Menampilkan mata kuliah per semester
SELECT semester, COUNT(kdmk) AS jumlah_matkul
FROM matakuliah
GROUP BY semester
ORDER BY semester;

-- 9. Update nilai mahasiswa
UPDATE nilai 
SET nilai_uas = 75 
WHERE nim = '101031001' AND kdmk = 'MPK131201';

-- 10. Menghapus data mahasiswa
-- (Hanya contoh, biasanya ada constraint foreign key)
-- DELETE FROM mahasiswa WHERE nim = '101031001';

-- 11. Transkrip nilai mahasiswa
SELECT m.nim, m.nama_m, mk.nama_mk, mk.sks,
       n.nilai_absen, n.nilai_tugas, n.nilai_uts, n.nilai_uas,
       ROUND((n.nilai_absen*0.1 + n.nilai_tugas*0.2 + n.nilai_uts*0.3 + n.nilai_uas*0.4), 2) AS nilai_akhir
FROM nilai n
JOIN mahasiswa m ON n.nim = m.nim
JOIN matakuliah mk ON n.kdmk = mk.kdmk
WHERE m.nim = 'I01031003';

-- 12. Daftar mahasiswa yang belum mengambil mata kuliah tertentu
SELECT m.nim, m.nama_m
FROM mahasiswa m
WHERE NOT EXISTS (
    SELECT 1 FROM nilai n 
    WHERE n.nim = m.nim 
    AND n.kdmk = 'MKK231203'
);

-- 13. Ranking mahasiswa berdasarkan IPK
SELECT m.nim, m.nama_m, 
       ROUND(SUM((n.nilai_absen*0.1 + n.nilai_tugas*0.2 + n.nilai_uts*0.3 + n.nilai_uas*0.4) * mk.sks) / SUM(mk.sks), 2) AS ipk
FROM nilai n
JOIN mahasiswa m ON n.nim = m.nim
JOIN matakuliah mk ON n.kdmk = mk.kdmk
GROUP BY m.nim, m.nama_m
ORDER BY ipk DESC;
