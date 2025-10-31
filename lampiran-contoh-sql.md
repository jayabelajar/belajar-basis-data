# 📎 LAMPIRAN CONTOH SQL

## A.1 Struktur Database Kampus (Contoh Lengkap)
Berikut contoh sederhana sistem database untuk kampus dengan tabel **Mahasiswa**, **Dosen**, **MataKuliah**, dan **Nilai**.

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
```

---

## A.2 Data Dummy Awal
```sql
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
```

---

## A.3 Query Dasar yang Sering Digunakan

### 🔹 Menampilkan Data
```sql
SELECT Nama, Prodi FROM Mahasiswa WHERE Angkatan = 2023;
```

### 🔹 Menggabungkan Beberapa Tabel
```sql
SELECT m.Nama, mk.NamaMK, n.Nilai
FROM Mahasiswa m
JOIN Nilai n ON m.NIM = n.NIM
JOIN MataKuliah mk ON mk.KodeMK = n.KodeMK;
```

### 🔹 Menampilkan Nilai Rata-rata per Mata Kuliah
```sql
SELECT mk.NamaMK, AVG(n.Nilai) AS RataRata
FROM Nilai n
JOIN MataKuliah mk ON n.KodeMK = mk.KodeMK
GROUP BY mk.NamaMK;
```

### 🔹 Menghitung Jumlah Mahasiswa per Prodi
```sql
SELECT Prodi, COUNT(*) AS Jumlah
FROM Mahasiswa
GROUP BY Prodi;
```

### 🔹 Menambah Data Baru
```sql
INSERT INTO Mahasiswa VALUES ('23010104', 'Dewi Lestari', 'Sistem Informasi', 2024);
```

### 🔹 Menghapus Data
```sql
DELETE FROM Nilai WHERE Nilai < 60;
```

---

## A.4 Backup dan Restore
### 🔹 Backup Database MySQL
```bash
mysqldump -u root -p kampus > backup_kampus.sql
```

### 🔹 Restore Database
```bash
mysql -u root -p kampus < backup_kampus.sql
```

---

# 📖 GLOSARIUM ISTILAH

| Istilah | Arti Singkat |
|----------|---------------|
| **Database** | Kumpulan data yang saling berhubungan dan terorganisir. |
| **DBMS** | Perangkat lunak untuk mengelola database (MySQL, PostgreSQL). |
| **SQL** | Bahasa standar untuk mengakses dan memanipulasi database. |
| **Table (Tabel)** | Struktur data dua dimensi berisi kolom dan baris. |
| **Field (Kolom)** | Atribut yang menyimpan satu jenis data. |
| **Record (Baris)** | Satu entri data lengkap dalam tabel. |
| **Primary Key (PK)** | Kolom unik untuk mengidentifikasi setiap record. |
| **Foreign Key (FK)** | Kolom penghubung antara tabel yang saling berelasi. |
| **Constraint** | Aturan yang membatasi nilai data (CHECK, UNIQUE, dll). |
| **Query** | Perintah untuk mengambil atau memodifikasi data. |
| **Join** | Menggabungkan dua atau lebih tabel berdasarkan relasi. |
| **View** | Tabel virtual berdasarkan hasil query. |
| **Index** | Struktur data untuk mempercepat pencarian. |
| **Transaction** | Kumpulan operasi SQL yang harus dijalankan seluruhnya. |
| **Normalization** | Proses merancang tabel agar efisien dan bebas duplikasi. |
| **Replication** | Penyalinan data antar server agar selalu sinkron. |
| **Partitioning** | Pembagian data ke beberapa bagian agar lebih efisien. |
| **NoSQL** | Database non-relasional untuk data besar dan tidak terstruktur. |
| **Big Data** | Kumpulan data berukuran besar, cepat, dan bervariasi. |
| **Cloud Database** | Database berbasis cloud yang dapat diakses online. |
| **ACID** | Prinsip transaksi: Atomicity, Consistency, Isolation, Durability. |
| **CAP Theorem** | Prinsip sistem terdistribusi: Consistency, Availability, Partition Tolerance. |
| **AI Database** | Database yang mengintegrasikan kecerdasan buatan untuk optimisasi otomatis. |

---

📘 *Lampiran ini berfungsi sebagai panduan cepat praktik SQL dasar dan pengingat istilah penting dalam dunia basis data.*
