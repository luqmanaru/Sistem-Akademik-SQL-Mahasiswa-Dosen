-- Tabel Jurusan
CREATE TABLE jurusan (
    kode_jur VARCHAR(2) PRIMARY KEY NOT NULL,
    nama_jur VARCHAR(50) NOT NULL
);

-- Tabel Mahasiswa
CREATE TABLE mahasiswa (
    nim VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_m VARCHAR(50) NOT NULL,
    tpt_lhr_m VARCHAR(20) NOT NULL,
    tgl_lhr_m DATE NOT NULL,
    j_kelamin VARCHAR(10) NOT NULL,
    alm_m VARCHAR(100) NOT NULL,
    kota_m VARCHAR(20) NOT NULL,
    agama_m VARCHAR(10) NOT NULL,
    telepon_m VARCHAR(20) NOT NULL,
    kode_jur VARCHAR(2) NOT NULL,
    FOREIGN KEY (kode_jur) REFERENCES jurusan(kode_jur)
);

-- Tabel Dosen
CREATE TABLE dosen (
    nid VARCHAR(3) PRIMARY KEY NOT NULL,
    nama_d VARCHAR(50) NOT NULL,
    alm_d VARCHAR(100) NOT NULL,
    telepon_d VARCHAR(20) NOT NULL,
    kode_jur VARCHAR(2) NOT NULL,
    FOREIGN KEY (kode_jur) REFERENCES jurusan(kode_jur)
);

-- Tabel Matakuliah
CREATE TABLE matakuliah (
    kdmk VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_mk VARCHAR(50) NOT NULL,
    sks INT NOT NULL,
    semester VARCHAR(2) NOT NULL
);

-- Tabel Nilai
CREATE TABLE nilai (
    nim VARCHAR(10) NOT NULL,
    kdmk VARCHAR(10) NOT NULL,
    smt VARCHAR(2) NOT NULL,
    nid VARCHAR(3) NOT NULL,
    nilai_absen INT NOT NULL,
    nilai_tugas INT NOT NULL,
    nilai_uts INT NOT NULL,
    nilai_uas INT NOT NULL,
    PRIMARY KEY (nim, kdmk),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    FOREIGN KEY (kdmk) REFERENCES matakuliah(kdmk),
    FOREIGN KEY (nid) REFERENCES dosen(nid)
);
