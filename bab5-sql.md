# 💾 BAB 5 – BAHASA SQL (STRUCTURED QUERY LANGUAGE)

## 5.1 Pengertian SQL
**SQL (Structured Query Language)** adalah bahasa standar yang digunakan untuk mengakses, mengelola, dan memanipulasi data dalam sistem basis data relasional (RDBMS).  
SQL memungkinkan pengguna untuk membuat tabel, menambah, menghapus, memperbarui, serta menampilkan data dengan perintah yang mudah dipahami.

> 🧠 SQL bersifat *declarative*, artinya pengguna cukup menyatakan **apa yang ingin dilakukan**, tanpa perlu menjelaskan **bagaimana caranya dilakukan**.

---

## 5.2 Jenis Perintah SQL
Bahasa SQL dibagi menjadi beberapa kategori berdasarkan fungsinya:

| Kategori | Nama Lengkap | Fungsi | Contoh Perintah |
|-----------|---------------|---------|-----------------|
| **DDL** | Data Definition Language | Membuat dan mengubah struktur tabel. | CREATE, ALTER, DROP |
| **DML** | Data Manipulation Language | Mengelola isi data di tabel. | SELECT, INSERT, UPDATE, DELETE |
| **DCL** | Data Control Language | Mengatur hak akses pengguna. | GRANT, REVOKE |
| **TCL** | Transaction Control Language | Mengelola transaksi data. | COMMIT, ROLLBACK |

---

## 5.3 DDL (Data Definition Language)
Digunakan untuk membuat atau menghapus struktur database.

```sql
-- Membuat tabel mahasiswa
CREATE TABLE Mahasiswa (
  NIM CHAR(8) PRIMARY KEY,
  Nama VARCHAR(100),
  Prodi VARCHAR(50),
  Angkatan YEAR
);

-- Mengubah struktur tabel
ALTER TABLE Mahasiswa ADD COLUMN Email VARCHAR(100);

-- Menghapus tabel
DROP TABLE Mahasiswa;
```

> 📘 DDL digunakan oleh administrator database untuk membangun kerangka database.

---

## 5.4 DML (Data Manipulation Language)
Digunakan untuk menambah, mengubah, menghapus, dan mengambil data.

### 🔹 Menambah Data
```sql
INSERT INTO Mahasiswa (NIM, Nama, Prodi, Angkatan)
VALUES ('23010101', 'Dewi Lestari', 'Teknik Informatika', 2023);
```

### 🔹 Mengambil Data
```sql
SELECT * FROM Mahasiswa;
SELECT Nama, Prodi FROM Mahasiswa WHERE Angkatan = 2023;
```

### 🔹 Mengubah Data
```sql
UPDATE Mahasiswa
SET Prodi = 'Sistem Informasi'
WHERE NIM = '23010101';
```

### 🔹 Menghapus Data
```sql
DELETE FROM Mahasiswa WHERE NIM = '23010101';
```

> 💡 Hati-hati menggunakan `DELETE` tanpa kondisi `WHERE`, karena bisa menghapus seluruh isi tabel!

---

## 5.5 DCL (Data Control Language)
Digunakan untuk memberikan atau mencabut hak akses pengguna.

```sql
-- Memberikan hak akses
GRANT SELECT, INSERT ON Mahasiswa TO 'user1'@'localhost';

-- Mencabut hak akses
REVOKE INSERT ON Mahasiswa FROM 'user1'@'localhost';
```

---

## 5.6 TCL (Transaction Control Language)
Digunakan untuk mengatur transaksi agar data tetap konsisten.

```sql
START TRANSACTION;

UPDATE Akun SET Saldo = Saldo - 100000 WHERE ID = 1;
UPDATE Akun SET Saldo = Saldo + 100000 WHERE ID = 2;

COMMIT;   -- Simpan perubahan permanen
-- atau
ROLLBACK; -- Batalkan semua perubahan
```

> 🎯 Konsep ACID (Atomicity, Consistency, Isolation, Durability) digunakan untuk memastikan transaksi aman dan konsisten.

---

## 5.7 Query Lanjutan

### 🔹 Pengurutan Data
```sql
SELECT * FROM Mahasiswa ORDER BY Nama ASC;
```

### 🔹 Pengelompokan Data
```sql
SELECT Prodi, COUNT(*) AS Jumlah
FROM Mahasiswa
GROUP BY Prodi;
```

### 🔹 Penggabungan Tabel (JOIN)
```sql
SELECT Mahasiswa.Nama, MataKuliah.NamaMK, Nilai
FROM Mahasiswa
JOIN Nilai ON Mahasiswa.NIM = Nilai.NIM
JOIN MataKuliah ON Nilai.KodeMK = MataKuliah.KodeMK;
```

### 🔹 Subquery
```sql
SELECT Nama, Prodi
FROM Mahasiswa
WHERE NIM IN (
  SELECT NIM FROM Nilai WHERE Nilai > 80
);
```

---

## 5.8 Fungsi Agregasi
Fungsi agregasi digunakan untuk menghitung hasil dari sekumpulan data.

| Fungsi | Keterangan | Contoh |
|---------|-------------|--------|
| **COUNT()** | Menghitung jumlah baris. | `SELECT COUNT(*) FROM Mahasiswa;` |
| **SUM()** | Menjumlahkan nilai. | `SELECT SUM(SKS) FROM MataKuliah;` |
| **AVG()** | Menghitung rata-rata. | `SELECT AVG(Nilai) FROM Nilai;` |
| **MAX()** | Nilai tertinggi. | `SELECT MAX(Nilai) FROM Nilai;` |
| **MIN()** | Nilai terendah. | `SELECT MIN(Nilai) FROM Nilai;` |

---

## 5.9 View (Tampilan Virtual)
**View** adalah tabel virtual yang menyimpan query untuk digunakan kembali.

```sql
CREATE VIEW DaftarNilai AS
SELECT Mahasiswa.Nama, MataKuliah.NamaMK, Nilai
FROM Mahasiswa
JOIN Nilai ON Mahasiswa.NIM = Nilai.NIM;
```

> View digunakan untuk menyederhanakan query kompleks dan meningkatkan keamanan (karena tidak semua kolom asli ditampilkan).

---

## 5.10 Index
**Index** digunakan untuk mempercepat proses pencarian data di tabel.

```sql
CREATE INDEX idx_nama ON Mahasiswa(Nama);
```

> 📈 Index meningkatkan kecepatan SELECT tapi bisa memperlambat INSERT dan UPDATE.

---

## 5.11 Kesimpulan
Bahasa SQL adalah jantung dari sistem basis data relasional.  
Dengan memahami jenis perintahnya (DDL, DML, DCL, TCL), kita dapat membuat, mengelola, dan mengamankan database dengan efisien.

Ciri utama SQL:
- Sintaks mudah dipahami.  
- Standar digunakan di semua DBMS besar.  
- Cocok untuk analisis data dan pengelolaan informasi.  

> 💾 *“Menguasai SQL berarti menguasai cara berbicara dengan data.”*

---

📚 **Selanjutnya:** BAB 6 – Integritas dan Keamanan Data
