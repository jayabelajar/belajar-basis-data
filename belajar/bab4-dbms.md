# ⚙️ BAB 4 – SISTEM MANAJEMEN BASIS DATA (DBMS)

## 4.1 Pengertian DBMS
**DBMS (Database Management System)** adalah perangkat lunak yang digunakan untuk membuat, mengelola, dan memelihara basis data.  
DBMS bertindak sebagai perantara antara pengguna (user/program) dengan data yang tersimpan secara fisik di media penyimpanan.

### Fungsi utama DBMS:
1. Menyimpan dan mengelola data secara efisien.  
2. Mengontrol akses dan keamanan data.  
3. Menyediakan bahasa untuk manipulasi data (SQL).  
4. Menjamin integritas dan konsistensi data.  
5. Mendukung transaksi dan pemulihan (*recovery*) jika terjadi kegagalan sistem.

> 💡 *DBMS memastikan data tetap aman, konsisten, dan mudah diakses oleh banyak pengguna secara bersamaan.*

---

## 4.2 Komponen Utama DBMS
| Komponen | Fungsi |
|-----------|---------|
| **Storage Manager** | Mengelola penyimpanan fisik data di disk. |
| **Query Processor** | Menerjemahkan dan menjalankan perintah SQL dari pengguna. |
| **Transaction Manager** | Menangani transaksi dan menjaga konsistensi data (ACID). |
| **Metadata Catalog (Data Dictionary)** | Menyimpan informasi struktur database seperti tabel, kolom, tipe data, dan relasi. |
| **Authorization & Security Manager** | Mengatur hak akses pengguna terhadap data. |

---

## 4.3 Arsitektur DBMS
Arsitektur DBMS dibagi menjadi beberapa model tergantung pada cara data dikelola dan diakses oleh pengguna.

### 🔹 1. Arsitektur Satu Tingkat (Single-Tier)
Aplikasi dan DBMS berada di komputer yang sama.  
Biasanya digunakan untuk aplikasi kecil seperti sistem lokal atau desktop.

### 🔹 2. Arsitektur Dua Tingkat (Two-Tier)
Terdiri dari:
- **Client**: menjalankan aplikasi pengguna.  
- **Server**: menjalankan DBMS dan mengelola data.  
Digunakan pada sistem client-server tradisional.

### 🔹 3. Arsitektur Tiga Tingkat (Three-Tier)
Memisahkan:
- **Client (Presentation Layer)** → antarmuka pengguna.  
- **Application Server (Logic Layer)** → menjalankan logika bisnis.  
- **Database Server (Data Layer)** → menyimpan dan mengelola data.  

> 🧩 Model tiga tingkat paling umum digunakan pada aplikasi web modern (frontend ↔ backend ↔ database).

---

## 4.4 Jenis-Jenis DBMS Berdasarkan Model Data
| Jenis DBMS | Deskripsi | Contoh |
|-------------|------------|---------|
| **Hierarki** | Data disusun dalam struktur pohon. | IBM IMS |
| **Jaringan** | Setiap record bisa punya banyak hubungan. | IDMS |
| **Relasional** | Data disimpan dalam tabel relasi (rows & columns). | MySQL, PostgreSQL, SQL Server |
| **Objek-Oriented** | Data disimpan dalam bentuk objek. | ObjectDB |
| **NoSQL** | Tidak menggunakan relasi, cocok untuk data besar/tidak terstruktur. | MongoDB, Cassandra, Redis |

---

## 4.5 Kelebihan dan Kekurangan DBMS
| Aspek | Kelebihan | Kekurangan |
|--------|------------|-------------|
| **Manajemen Data** | Data lebih terpusat dan teratur. | Instalasi dan konfigurasi cukup kompleks. |
| **Keamanan** | Mendukung pengaturan hak akses per pengguna. | Perlu administrator khusus (DBA). |
| **Integritas Data** | Menjamin konsistensi melalui constraint dan transaksi. | Kinerja menurun jika desain buruk. |
| **Multi-user** | Dapat digunakan banyak pengguna bersamaan. | Perlu sistem transaksi yang kuat untuk menghindari konflik. |

---

## 4.6 Contoh Penggunaan DBMS di Dunia Nyata
| Bidang | Contoh Sistem | DBMS yang Umum Dipakai |
|----------|----------------|------------------------|
| Pendidikan | Sistem Akademik Kampus | MySQL, MariaDB |
| Perbankan | Sistem Transaksi Nasabah | Oracle, PostgreSQL |
| E-Commerce | Sistem Toko Online | MySQL, MongoDB |
| Pemerintahan | Aplikasi Kependudukan | SQL Server |
| Media Sosial | Platform Konten & Komentar | Cassandra, Redis |

---

## 4.7 Perbandingan DBMS Populer
| DBMS | Lisensi | Kelebihan | Cocok Untuk |
|-------|----------|-------------|-------------|
| **MySQL** | Open Source | Cepat, stabil, dukungan komunitas besar | Web apps, CMS |
| **PostgreSQL** | Open Source | Dukungan fitur kompleks, ACID penuh | Enterprise systems |
| **Oracle** | Berbayar | Sangat kuat & aman, performa tinggi | Perbankan, korporasi besar |
| **SQL Server** | Berbayar | Integrasi dengan sistem Windows | Perusahaan berbasis Microsoft |
| **MongoDB** | Open Source | Tanpa skema, fleksibel untuk big data | Aplikasi modern berbasis dokumen |

---

## 4.8 Transaksi dan Konsep ACID (Overview)
Salah satu fitur penting DBMS adalah mendukung **transaksi data** yang aman dan konsisten.

**Konsep ACID:**
1. **Atomicity** – Semua operasi dalam transaksi harus selesai seluruhnya atau tidak sama sekali.  
2. **Consistency** – Setelah transaksi selesai, data harus tetap valid sesuai aturan database.  
3. **Isolation** – Transaksi berjalan terpisah tanpa saling mengganggu.  
4. **Durability** – Perubahan data yang berhasil disimpan akan tetap ada meskipun sistem mati.

Contoh sederhana:
```sql
START TRANSACTION;

UPDATE akun SET saldo = saldo - 100000 WHERE id = 1;
UPDATE akun SET saldo = saldo + 100000 WHERE id = 2;

COMMIT;
```
> Jika salah satu perintah gagal, sistem akan melakukan `ROLLBACK`.

---

## 4.9 Fitur-Fitur Umum DBMS
- **Data Definition Language (DDL)** → CREATE, ALTER, DROP  
- **Data Manipulation Language (DML)** → SELECT, INSERT, UPDATE, DELETE  
- **Data Control Language (DCL)** → GRANT, REVOKE  
- **Transaction Control Language (TCL)** → COMMIT, ROLLBACK  
- **Backup dan Recovery** → menjaga keamanan data dari kehilangan  
- **Concurrency Control** → menangani akses data oleh banyak pengguna secara bersamaan  

---

## 4.10 Kesimpulan
DBMS adalah komponen vital dalam sistem informasi modern.  
Dengan DBMS, pengelolaan data menjadi lebih efisien, aman, dan dapat diakses oleh banyak pengguna secara bersamaan.

Ciri-ciri DBMS yang baik:
- Menjamin integritas dan keamanan data.  
- Mendukung transaksi dengan prinsip ACID.  
- Mudah diintegrasikan dengan aplikasi lain.  
- Memiliki performa tinggi dan skalabilitas baik.

> ⚙️ *“DBMS adalah jantung dari sistem informasi — tanpa DBMS, data hanyalah tumpukan angka tanpa makna.”*

---

📚 **Selanjutnya:** BAB 5 – Bahasa SQL →](./bab4-sql.md)
