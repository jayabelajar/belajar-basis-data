# ⚡ BAB 8 – OPTIMISASI DAN INDEKS

## 8.1 Pengertian Optimisasi Basis Data
**Optimisasi basis data (Database Optimization)** adalah proses meningkatkan performa sistem database agar query berjalan lebih cepat, efisien, dan tidak membebani sumber daya server.

Tujuan utama optimisasi:
- Mengurangi waktu respon query (query response time).  
- Meminimalkan penggunaan memori dan CPU.  
- Meningkatkan efisiensi penyimpanan data.  
- Mempercepat pengambilan (retrieval) dan pembaruan data.

> ⚙️ *Optimisasi yang baik membuat sistem besar tetap ringan dan responsif.*

---

## 8.2 Faktor yang Mempengaruhi Kinerja Database
1. **Struktur Tabel** – desain tabel dan relasi yang tidak efisien memperlambat query.  
2. **Indeks** – pemilihan kolom yang tepat untuk indexing mempercepat pencarian data.  
3. **Query** – perintah SQL yang tidak optimal menyebabkan beban tinggi.  
4. **Jumlah Data** – semakin besar volume data, semakin besar kebutuhan optimisasi.  
5. **Hardware dan Konfigurasi DBMS** – kecepatan disk, RAM, cache, dan setting buffer pool.

---

## 8.3 Teknik Optimisasi Umum
| Teknik | Penjelasan |
|---------|-------------|
| **Indexing** | Membuat indeks untuk mempercepat pencarian data. |
| **Query Optimization** | Menulis ulang query agar lebih efisien. |
| **Normalization** | Mengurangi duplikasi data agar penyimpanan lebih efisien. |
| **Caching** | Menyimpan hasil query sementara untuk mengurangi beban sistem. |
| **Partitioning** | Memecah tabel besar menjadi beberapa bagian kecil. |
| **Connection Pooling** | Menggunakan koneksi database yang sudah ada untuk menghemat waktu. |

---

## 8.4 Pengertian Indeks
**Indeks (Index)** adalah struktur data tambahan yang digunakan DBMS untuk mempercepat proses pencarian data dalam tabel.

> 🔍 Tanpa indeks, DBMS harus membaca seluruh tabel (full table scan) untuk menemukan data — ini sangat lambat untuk tabel besar.

---

## 8.5 Jenis-Jenis Indeks
| Jenis Indeks | Deskripsi | Kelebihan | Kekurangan |
|---------------|------------|-------------|-------------|
| **Primary Index** | Otomatis dibuat pada kolom *primary key*. | Unik dan cepat untuk identifikasi data. | Tidak fleksibel untuk kolom lain. |
| **Secondary Index** | Dibuat manual pada kolom selain PK. | Meningkatkan performa query pencarian. | Memakan ruang penyimpanan tambahan. |
| **Unique Index** | Menjamin nilai dalam kolom selalu unik. | Mencegah duplikasi data. | Sedikit memperlambat `INSERT`/`UPDATE`. |
| **Composite Index** | Indeks pada kombinasi beberapa kolom. | Efektif untuk query dengan banyak kondisi `WHERE`. | Perlu perencanaan kolom yang tepat. |
| **Full-Text Index** | Untuk pencarian teks panjang. | Ideal untuk sistem pencarian (search engine). | Membutuhkan banyak ruang. |
| **Clustered Index** | Menentukan urutan fisik data di disk. | Cepat untuk pengambilan data berurutan. | Satu tabel hanya boleh punya satu clustered index. |

---

## 8.6 Contoh Implementasi Indeks
```sql
-- Membuat index pada kolom nama
CREATE INDEX idx_nama ON Mahasiswa(Nama);

-- Membuat unique index pada email
CREATE UNIQUE INDEX idx_email ON Mahasiswa(Email);

-- Menghapus index
DROP INDEX idx_nama ON Mahasiswa;
```

> 💡 Indeks sangat membantu untuk query `SELECT`, tapi bisa memperlambat `INSERT` dan `UPDATE` karena sistem harus memperbarui indeks juga.

---

## 8.7 Query Optimization (Optimisasi Query)
Menulis query SQL yang efisien bisa meningkatkan performa tanpa mengubah struktur tabel.

### Tips Optimisasi Query:
1. Gunakan **SELECT kolom spesifik**, hindari `SELECT *`.  
2. Gunakan **LIMIT** untuk membatasi hasil query.  
3. Gunakan **JOIN** daripada subquery jika memungkinkan.  
4. Gunakan **WHERE** untuk menyaring data sejak awal.  
5. Gunakan **EXPLAIN** untuk menganalisis performa query.  

### Contoh:
```sql
-- Kurang efisien
SELECT * FROM Mahasiswa;

-- Lebih efisien
SELECT Nama, Prodi FROM Mahasiswa WHERE Angkatan = 2023;
```

---

## 8.8 EXPLAIN – Analisis Query
Perintah `EXPLAIN` digunakan untuk melihat bagaimana DBMS menjalankan query dan menggunakan indeks.

```sql
EXPLAIN SELECT * FROM Mahasiswa WHERE Prodi = 'Teknik Informatika';
```

Hasilnya menunjukkan apakah query melakukan *full scan* atau memakai *index scan*.

---

## 8.9 Partitioning (Pemecahan Tabel)
**Partitioning** adalah teknik memecah tabel besar menjadi beberapa bagian kecil berdasarkan kriteria tertentu agar lebih cepat diakses.

### Jenis Partitioning:
| Jenis | Deskripsi | Contoh |
|--------|------------|---------|
| **Range Partitioning** | Berdasarkan rentang nilai. | Berdasarkan tahun angkatan. |
| **List Partitioning** | Berdasarkan daftar nilai tertentu. | Berdasarkan prodi. |
| **Hash Partitioning** | Berdasarkan hasil fungsi hash. | ID hash mahasiswa. |
| **Composite Partitioning** | Kombinasi dari beberapa jenis. | Range + Hash. |

### Contoh:
```sql
CREATE TABLE Nilai (
  NIM CHAR(8),
  KodeMK CHAR(5),
  Nilai INT,
  Tahun YEAR
)
PARTITION BY RANGE (Tahun) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024)
);
```

---

## 8.10 Caching
Caching menyimpan data hasil query dalam memori agar akses selanjutnya lebih cepat.  
Biasa digunakan pada aplikasi besar yang sering mengulang query serupa.

Contoh teknologi caching:
- **Memcached**  
- **Redis**  
- **Query cache bawaan MySQL / PostgreSQL**

> ⚙️ Caching meningkatkan performa drastis, tapi harus diatur agar data tetap konsisten saat ada perubahan.

---

## 8.11 Maintenance dan Monitoring Kinerja
Untuk menjaga kinerja database tetap optimal:
1. **Gunakan ANALYZE TABLE** untuk memperbarui statistik query planner.  
2. **Gunakan OPTIMIZE TABLE** untuk merapikan tabel setelah banyak perubahan.  
3. **Monitor log query lambat (slow query log)**.  
4. **Gunakan alat pemantauan DBMS** seperti phpMyAdmin, pgAdmin, atau Grafana.

---

## 8.12 Contoh Monitoring Query Lambat
```sql
SET GLOBAL slow_query_log = 1;
SET GLOBAL long_query_time = 2;
SHOW VARIABLES LIKE 'slow_query_log%';
```

> ⏱️ Semua query dengan waktu eksekusi lebih dari 2 detik akan tercatat dalam log.

---

## 8.13 Kesimpulan
Optimisasi dan penggunaan indeks sangat penting untuk menjaga kinerja database, terutama pada sistem dengan data besar dan banyak pengguna.  

Prinsip utama:
- Gunakan indeks dengan bijak (tidak berlebihan).  
- Analisis performa query secara berkala.  
- Gunakan caching dan partitioning jika diperlukan.  

> ⚡ *“Database cepat bukan karena servernya kuat, tapi karena strukturnya cerdas.”*

---

📚 **Selanjutnya:** [BAB 9 - Basis Data Terdistribusi →](./bab9-basis-data-terdistribusi.md)
