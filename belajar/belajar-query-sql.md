# 🧩 MATERI QUERY SQL LENGKAP + CONTOH PENGGUNAAN

Dokumen ini berisi penjelasan lengkap berbagai jenis query SQL, fungsinya, serta contoh penerapan nyata di database kampus sederhana (`mahasiswa`, `dosen`, `matakuliah`, `nilai`).

---

## 🧱 1. SELECT – Menampilkan Data
**Fungsi:** Mengambil data dari satu atau beberapa tabel.  
**Sintaks:**
```sql
SELECT kolom1, kolom2 FROM nama_tabel;
```

**Contoh:**
```sql
SELECT nama, prodi FROM mahasiswa;
```
📘 *Menampilkan nama dan program studi semua mahasiswa.*

---

## 🔍 2. WHERE – Menyaring Data
**Fungsi:** Memfilter baris berdasarkan kondisi tertentu.  
**Operator umum:** `=`, `!=`, `<`, `>`, `<=`, `>=`, `BETWEEN`, `LIKE`, `IN`, `IS NULL`.

**Contoh:**
```sql
SELECT * FROM mahasiswa WHERE prodi = 'Teknik Informatika';
SELECT * FROM nilai WHERE nilai BETWEEN 80 AND 100;
SELECT * FROM mahasiswa WHERE nama LIKE 'A%';
```
📘 *Menampilkan data mahasiswa TI, nilai antara 80–100, atau nama yang diawali huruf A.*

---

## 📊 3. ORDER BY – Mengurutkan Data
**Fungsi:** Mengurutkan hasil berdasarkan kolom tertentu.  
**Default:** ASC (menaik), gunakan `DESC` untuk menurun.

**Contoh:**
```sql
SELECT nama, nilai FROM nilai ORDER BY nilai DESC;
```
📘 *Mengurutkan daftar nilai tertinggi ke terendah.*

---

## 📋 4. DISTINCT – Menghilangkan Duplikasi
**Fungsi:** Menampilkan nilai unik dari kolom.

**Contoh:**
```sql
SELECT DISTINCT prodi FROM mahasiswa;
```
📘 *Menampilkan daftar program studi tanpa duplikasi.*

---

## 🧮 5. Fungsi Agregat
**Fungsi:** Menghitung hasil numerik dari sekelompok data.  
**Fungsi utama:**  
- `COUNT()` → menghitung jumlah baris  
- `SUM()` → menjumlahkan nilai  
- `AVG()` → menghitung rata-rata  
- `MIN()` / `MAX()` → mencari nilai minimum/maksimum  

**Contoh:**
```sql
SELECT COUNT(*) AS total_mhs FROM mahasiswa;
SELECT AVG(nilai) AS rata2 FROM nilai;
SELECT MIN(nilai), MAX(nilai) FROM nilai;
```
📘 *Menghitung jumlah mahasiswa, rata-rata nilai, dan nilai tertinggi/terendah.*

---

## 🧱 6. GROUP BY – Mengelompokkan Data
**Fungsi:** Mengelompokkan data berdasarkan kolom tertentu, biasanya digunakan dengan fungsi agregat.

**Contoh:**
```sql
SELECT prodi, COUNT(*) AS jumlah
FROM mahasiswa
GROUP BY prodi;
```
📘 *Menghitung jumlah mahasiswa per program studi.*

---

## 🎯 7. HAVING – Menyaring Kelompok Data
**Fungsi:** Menyaring hasil setelah `GROUP BY`.  
**Beda dengan WHERE:** WHERE memfilter baris, HAVING memfilter hasil agregasi.

**Contoh:**
```sql
SELECT prodi, COUNT(*) AS jumlah
FROM mahasiswa
GROUP BY prodi
HAVING COUNT(*) > 10;
```
📘 *Menampilkan hanya prodi yang mahasiswanya lebih dari 10 orang.*

---

## 🔗 8. JOIN – Menggabungkan Tabel
**Fungsi:** Mengambil data dari beberapa tabel berdasarkan relasi (foreign key).

### Jenis-jenis JOIN:
| Jenis | Penjelasan | Hasil |
|-------|-------------|-------|
| INNER JOIN | Hanya data yang cocok di kedua tabel | Data yang berelasi |
| LEFT JOIN | Semua dari kiri + cocok dari kanan | Data kiri tetap tampil |
| RIGHT JOIN | Semua dari kanan + cocok dari kiri | Data kanan tetap tampil |
| FULL JOIN | Semua data, cocok/tidak (PostgreSQL) | Gabungan penuh |

**Contoh:**
```sql
SELECT m.nama, mk.nama_mk, n.nilai
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim
JOIN matakuliah mk ON n.kode_mk = mk.kode_mk;
```
📘 *Menampilkan nama mahasiswa, nama mata kuliah, dan nilai ujian.*

---

## 🧩 9. ALIAS – Nama Sementara
**Fungsi:** Memberikan nama lain untuk tabel/kolom agar query lebih singkat.

**Contoh:**
```sql
SELECT m.nama AS Mahasiswa, mk.nama_mk AS MataKuliah, n.nilai AS Nilai
FROM mahasiswa AS m
JOIN nilai AS n ON m.nim = n.nim
JOIN matakuliah AS mk ON n.kode_mk = mk.kode_mk;
```

---

## 📦 10. LIMIT & OFFSET – Batas Hasil
**Fungsi:** Mengatur jumlah baris yang ditampilkan.

**Contoh:**
```sql
SELECT * FROM mahasiswa LIMIT 5;
SELECT * FROM mahasiswa LIMIT 5 OFFSET 10;
```
📘 *Menampilkan 5 data pertama, atau mulai dari baris ke-11.*

---

## 🔁 11. SUBQUERY – Query di Dalam Query
**Fungsi:** Menggunakan hasil query lain sebagai sumber data.

**Contoh:**
```sql
SELECT nama, nilai
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim
WHERE nilai > (SELECT AVG(nilai) FROM nilai);
```
📘 *Menampilkan mahasiswa yang nilainya di atas rata-rata keseluruhan.*

---

## ⚙️ 12. UNION – Menggabungkan Hasil Query
**Fungsi:** Menggabungkan dua hasil query dengan jumlah kolom yang sama.

**Contoh:**
```sql
SELECT nama, 'Mahasiswa' AS status FROM mahasiswa
UNION
SELECT nama, 'Dosen' AS status FROM dosen;
```
📘 *Menggabungkan daftar nama mahasiswa dan dosen dalam satu hasil.*

---

## 🔒 13. BETWEEN, IN, LIKE
**Fungsi:** Operator filter lanjutan.

**Contoh:**
```sql
SELECT * FROM nilai WHERE nilai BETWEEN 70 AND 90;
SELECT * FROM mahasiswa WHERE prodi IN ('TI','SI');
SELECT * FROM mahasiswa WHERE nama LIKE '%Dewi%';
```
📘 *Mencari nilai antara 70–90, prodi tertentu, atau nama yang mengandung kata "Dewi".*

---

## ⏰ 14. Fungsi Tanggal dan Waktu
**Fungsi umum:** `NOW()`, `CURDATE()`, `YEAR()`, `MONTH()`, `DAY()`, `DATEDIFF()`

**Contoh:**
```sql
SELECT NOW();
SELECT YEAR(CURDATE()) AS tahun_sekarang;
SELECT DATEDIFF('2025-12-01','2025-11-01') AS selisih_hari;
```
📘 *Menampilkan waktu saat ini, tahun berjalan, dan selisih tanggal.*

---

## 🧮 15. Fungsi Matematika
| Fungsi | Kegunaan | Contoh |
|---------|-----------|---------|
| `ABS(x)` | Nilai mutlak | `SELECT ABS(-10);` |
| `ROUND(x, d)` | Pembulatan desimal | `SELECT ROUND(89.567, 1);` |
| `CEIL(x)` / `FLOOR(x)` | Pembulatan naik/turun | `SELECT CEIL(7.2);` |
| `POWER(a,b)` | Pangkat | `SELECT POWER(2,3);` |
| `MOD(a,b)` | Sisa bagi | `SELECT MOD(10,3);` |

---

## 🔠 16. Fungsi String
| Fungsi | Kegunaan | Contoh |
|---------|-----------|---------|
| `CONCAT(a,b)` | Gabung teks | `SELECT CONCAT(nama,' - ',prodi);` |
| `LOWER()` / `UPPER()` | Huruf kecil/besar | `SELECT UPPER(nama);` |
| `LENGTH()` | Panjang string | `SELECT LENGTH(nama);` |
| `SUBSTRING()` | Potong string | `SELECT SUBSTRING(nama,1,4);` |
| `REPLACE()` | Ganti teks | `SELECT REPLACE(nama,' ','_');` |

---

## 📈 17. VIEW – Tabel Virtual
**Fungsi:** Menyimpan query kompleks sebagai tampilan siap pakai.

**Contoh:**
```sql
CREATE VIEW v_nilai_mahasiswa AS
SELECT m.nama, mk.nama_mk, n.nilai
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim
JOIN matakuliah mk ON n.kode_mk = mk.kode_mk;
```
📘 *Sekarang bisa dipanggil seperti tabel biasa:*
```sql
SELECT * FROM v_nilai_mahasiswa;
```

---

## 🧾 18. CASE – Logika Kondisional
**Fungsi:** Menentukan hasil berdasarkan kondisi tertentu.

**Contoh:**
```sql
SELECT nama, nilai,
CASE
  WHEN nilai >= 85 THEN 'A'
  WHEN nilai >= 70 THEN 'B'
  WHEN nilai >= 60 THEN 'C'
  ELSE 'D'
END AS Grade
FROM nilai;
```
📘 *Mengubah angka nilai menjadi huruf mutu.*

---

## 🧩 19. TRANSACTION & ROLLBACK
**Fungsi:** Menjamin konsistensi data dalam serangkaian perintah.

**Contoh:**
```sql
START TRANSACTION;
UPDATE akun SET saldo = saldo - 100000 WHERE id = 1;
UPDATE akun SET saldo = saldo + 100000 WHERE id = 2;
COMMIT;
-- jika gagal
ROLLBACK;
```

---

## 🔁 20. JOIN TINGKAT LANJUT
**Fungsi:** Menggabungkan tabel yang saling berelasi kompleks.

**Contoh:**
```sql
SELECT d.nama AS dosen, mk.nama_mk, COUNT(n.nim) AS jumlah_mahasiswa
FROM dosen d
JOIN matakuliah mk ON d.id_dosen = mk.id_dosen
LEFT JOIN nilai n ON mk.kode_mk = n.kode_mk
GROUP BY d.nama, mk.nama_mk;
```
📘 *Menampilkan setiap dosen, mata kuliah yang dia ajar, dan jumlah mahasiswa yang mengambilnya.*

---

## 📎 21. Fungsi IF dan COALESCE
**Fungsi:** Mengganti nilai NULL atau membuat logika sederhana.

**Contoh:**
```sql
SELECT nama, COALESCE(email, 'tidak ada email') AS email_diperbaiki
FROM mahasiswa;

SELECT nama, IF(nilai>=60,'Lulus','Tidak Lulus') AS status
FROM nilai;
```
📘 *Menampilkan teks pengganti jika email kosong, atau menentukan status kelulusan.*

---

## ⚙️ 22. INDEX dan OPTIMISASI
**Fungsi:** Meningkatkan kecepatan pencarian data.

**Contoh:**
```sql
CREATE INDEX idx_nim ON nilai(nim);
EXPLAIN SELECT * FROM nilai WHERE nim='23010101';
```
📘 *Melihat apakah query menggunakan index.*

---

## 💾 23. BACKUP & RESTORE (MySQL)
```bash
mysqldump -u root -p db_kampus > backup.sql
mysql -u root -p db_kampus < backup.sql
```

---

## 🧠 RANGKUMAN
| Perintah | Fungsi Utama |
|-----------|---------------|
| `SELECT` | Mengambil data |
| `INSERT` | Menambah data |
| `UPDATE` | Memperbarui data |
| `DELETE` | Menghapus data |
| `WHERE` | Menyaring data |
| `GROUP BY` | Mengelompokkan data |
| `HAVING` | Filter setelah agregasi |
| `JOIN` | Gabungkan tabel |
| `ORDER BY` | Urutkan hasil |
| `LIMIT` | Batasi hasil |
| `VIEW` | Tabel virtual |
| `CASE` | Logika kondisi |
| `TRANSACTION` | Jaminan integritas data |

---

📚 **Catatan Akhir**
> SQL (Structured Query Language) adalah bahasa standar untuk mengelola data dalam database relasional.  
> Kuasai query dasar → pahami relasi → latihan dengan studi kasus → dan analisis data akan terasa alami.

