# 🌐 BAB 9 – BASIS DATA TERDISTRIBUSI DAN REPLIKASI

## 9.1 Pengertian Basis Data Terdistribusi
**Basis data terdistribusi (Distributed Database)** adalah sistem database yang menyimpan data di beberapa lokasi fisik (server atau node) yang saling terhubung melalui jaringan, tetapi berperilaku seolah-olah seperti satu database tunggal bagi pengguna.

> 💡 *Dengan sistem terdistribusi, pengguna dapat mengakses data dari lokasi mana pun tanpa perlu tahu di mana data tersebut disimpan secara fisik.*

---

## 9.2 Tujuan Basis Data Terdistribusi
1. **Ketersediaan tinggi (High Availability)** – jika satu server gagal, data masih bisa diakses dari server lain.  
2. **Skalabilitas** – beban kerja bisa dibagi ke beberapa server.  
3. **Efisiensi akses lokal** – pengguna dapat mengakses data dari server terdekat.  
4. **Kemandirian lokasi** – data bisa tersebar tapi tetap terintegrasi.  
5. **Reliabilitas** – meminimalkan risiko kehilangan data.

---

## 9.3 Karakteristik Sistem Basis Data Terdistribusi
| Karakteristik | Deskripsi |
|----------------|------------|
| **Data Distribution** | Data disimpan di beberapa node yang berbeda. |
| **Transparency** | Pengguna tidak perlu tahu lokasi data sebenarnya. |
| **Replication** | Data dapat disalin antar server untuk keandalan. |
| **Autonomy** | Tiap node dapat bekerja secara independen. |
| **Concurrency Control** | Menjamin konsistensi walau ada banyak transaksi. |

---

## 9.4 Jenis-jenis Distribusi Data
| Jenis Distribusi | Deskripsi | Contoh |
|--------------------|------------|---------|
| **Horizontal Fragmentation** | Data dibagi berdasarkan baris. | Mahasiswa per angkatan di server berbeda. |
| **Vertical Fragmentation** | Data dibagi berdasarkan kolom. | Data pribadi di satu server, data akademik di server lain. |
| **Replication** | Menyimpan salinan data di beberapa lokasi. | Backup data di dua pusat data berbeda. |
| **Mixed Fragmentation** | Kombinasi dari fragmentasi horizontal dan vertikal. | Campuran pembagian baris dan kolom. |

---

## 9.5 Contoh Skenario Database Terdistribusi
Misalkan universitas memiliki tiga kampus:
- **Kampus A (Surabaya)** – menyimpan data Mahasiswa dan Dosen.  
- **Kampus B (Gresik)** – menyimpan data Mata Kuliah dan Nilai.  
- **Kampus C (Bawean)** – menyimpan data Administrasi dan Keuangan.  

Semua database saling terhubung melalui jaringan dan bisa diakses oleh sistem pusat menggunakan **federated database** atau **database link**.

---

## 9.6 Arsitektur Sistem Terdistribusi
### 🔹 1. Arsitektur Client-Server
- Klien mengirim query ke server yang menyimpan data.  
- Sederhana dan umum digunakan untuk aplikasi skala menengah.

### 🔹 2. Arsitektur Peer-to-Peer (P2P)
- Semua node berperan setara (tidak ada pusat utama).  
- Digunakan dalam sistem skala besar dan tahan gangguan (fault tolerant).

### 🔹 3. Arsitektur Multi-Database
- Beberapa database independen bekerja sama melalui middleware.  
- Digunakan pada sistem antar organisasi.

---

## 9.7 Pengertian Replikasi Data
**Replikasi (Replication)** adalah proses membuat dan memelihara salinan data di beberapa server untuk meningkatkan ketersediaan, kecepatan akses, dan keamanan data.

> 📀 Tujuan utama replikasi adalah memastikan data tetap sinkron antar server.

---

## 9.8 Jenis-jenis Replikasi
| Jenis | Deskripsi | Contoh |
|--------|------------|--------|
| **Master-Slave Replication** | Satu server utama (master) menulis data, server lain (slave) hanya membaca salinannya. | MySQL replication |
| **Master-Master Replication** | Dua atau lebih server bisa saling menulis dan memperbarui data. | PostgreSQL, MariaDB |
| **Snapshot Replication** | Menyalin seluruh data secara periodik. | Data warehouse backup |
| **Transactional Replication** | Menyalin perubahan (INSERT, UPDATE, DELETE) secara real-time. | Sistem transaksi online |
| **Merge Replication** | Menggabungkan perubahan dari dua arah (client ↔ server). | Aplikasi mobile offline sync |

---

## 9.9 Contoh Implementasi Replikasi di MySQL
### 🔹 Konfigurasi Master
Edit file `my.cnf`:
```
[mysqld]
server-id=1
log_bin=mysql-bin
```

### 🔹 Konfigurasi Slave
```
[mysqld]
server-id=2
relay-log=relay-bin
```

### 🔹 Sinkronisasi Slave
```sql
CHANGE MASTER TO
MASTER_HOST='192.168.1.10',
MASTER_USER='replica',
MASTER_PASSWORD='replica123',
MASTER_LOG_FILE='mysql-bin.000001',
MASTER_LOG_POS=4;

START SLAVE;
```

> Setelah diatur, semua perubahan di server master otomatis dikirim ke server slave.

---

## 9.10 Keuntungan Replikasi
✅ Kinerja meningkat — karena query baca bisa dilakukan di server slave.  
✅ Ketersediaan tinggi — jika master gagal, slave dapat mengambil alih.  
✅ Skalabilitas sistem — beban dapat dibagi antar server.  
✅ Perlindungan data — data tetap tersedia walau salah satu node rusak.

---

## 9.11 Tantangan dan Kelemahan Sistem Terdistribusi
| Tantangan | Penjelasan |
|------------|-------------|
| **Sinkronisasi Data** | Harus menjaga agar semua node memiliki data terbaru. |
| **Kompleksitas Manajemen** | Konfigurasi dan pemantauan lebih rumit. |
| **Latency Jaringan** | Akses antar lokasi dapat menambah waktu respon. |
| **Konsistensi** | Replikasi bisa menimbulkan konflik data. |
| **Biaya Infrastruktur** | Membutuhkan lebih banyak server dan bandwidth. |

---

## 9.12 CAP Theorem
Dalam sistem terdistribusi, sulit mencapai **Consistency**, **Availability**, dan **Partition Tolerance** secara bersamaan.  
Biasanya sistem hanya dapat memilih dua dari tiga.

| Aspek | Arti |
|--------|------|
| **Consistency** | Semua node memiliki data yang sama. |
| **Availability** | Sistem selalu dapat diakses kapan pun. |
| **Partition Tolerance** | Sistem tetap berjalan walau terjadi gangguan jaringan. |

> 💬 *Contoh:*  
> - **MongoDB** lebih fokus pada Availability + Partition Tolerance (AP).  
> - **SQL tradisional** lebih fokus pada Consistency + Availability (CA).

---

## 9.13 Federated Database System
**Federated Database** menggabungkan beberapa database independen menjadi satu sistem virtual tanpa harus menyatukan fisiknya.

### Kelebihan:
- Tidak perlu migrasi data.  
- Setiap organisasi tetap mengelola databasenya sendiri.  
- Query lintas database bisa dijalankan secara terpusat.

### Contoh:
```sql
CREATE SERVER kampus_b
FOREIGN DATA WRAPPER mysql
OPTIONS (HOST '192.168.1.20', DATABASE 'db_kampus_b');

CREATE TABLE mahasiswa_remote (
  NIM CHAR(8),
  Nama VARCHAR(100)
) ENGINE=FEDERATED
CONNECTION='mysql://user:pass@192.168.1.20/db_kampus_b/mahasiswa';
```

---

## 9.14 Kesimpulan
Basis data terdistribusi dan replikasi adalah solusi untuk sistem berskala besar yang menuntut kinerja tinggi dan ketersediaan terus-menerus.  

Keuntungan utama:
- **Kinerja meningkat** dengan pembagian beban kerja.  
- **Ketersediaan tinggi** karena ada salinan data di banyak lokasi.  
- **Fleksibilitas sistem** karena node bisa ditambah sesuai kebutuhan.  

> 🌍 *“Distribusi bukan hanya soal lokasi data, tapi tentang bagaimana sistem tetap utuh meski tersebar di seluruh dunia.”*

---

📚 **Selanjutnya:** [BAB 10 - Tren Database Modern →](./bab10-tren-database-modern.md)
