```sql
-- Membuat database
CREATE DATABASE kampus;
USE kampus;

-- Tabel Mahasiswa
CREATE TABLE Mahasiswa (
  NIM CHAR(8) PRIMARY KEY,
  Nama VARCHAR(100),
  Prodi VARCHAR(50),
  Angkatan YEAR
);

-- Tabel Dosen
CREATE TABLE Dosen (
  ID_Dosen CHAR(5) PRIMARY KEY,
  Nama_Dosen VARCHAR(100),
  Keahlian VARCHAR(50)
);

-- Tabel MataKuliah
CREATE TABLE MataKuliah (
  KodeMK CHAR(5) PRIMARY KEY,
  NamaMK VARCHAR(100),
  SKS INT,
  ID_Dosen CHAR(5),
  FOREIGN KEY (ID_Dosen) REFERENCES Dosen(ID_Dosen)
);

-- Tabel Nilai
CREATE TABLE Nilai (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  NIM CHAR(8),
  KodeMK CHAR(5),
  Nilai INT CHECK (Nilai BETWEEN 0 AND 100),
  FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM),
  FOREIGN KEY (KodeMK) REFERENCES MataKuliah(KodeMK)
);


INSERT INTO Mahasiswa VALUES
('23010101', 'Budi Santoso', 'Teknik Informatika', 2023),
('23010102', 'Rina Dewi', 'Sistem Informasi', 2023),
('23010103', 'Andi Wijaya', 'Teknik Informatika', 2022);

INSERT INTO Dosen VALUES
('D001', 'Dr. Sari Wulandari', 'Basis Data'),
('D002', 'Ir. Andi Pratama', 'Pemrograman');

INSERT INTO MataKuliah VALUES
('MK01', 'Basis Data', 3, 'D001'),
('MK02', 'Algoritma dan Pemrograman', 3, 'D002');

INSERT INTO Nilai (NIM, KodeMK, Nilai) VALUES
('23010101', 'MK01', 85),
('23010102', 'MK02', 90),
('23010103', 'MK01', 78);
