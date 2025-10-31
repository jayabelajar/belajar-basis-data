# 🔒 BAB 6 – INTEGRITAS DAN KEAMANAN DATA

## 6.1 Pengertian Integritas Data
**Integritas data** adalah jaminan bahwa data di dalam database selalu akurat, konsisten, dan dapat dipercaya sepanjang siklus hidupnya.  
Tujuan utamanya adalah mencegah data rusak, ganda, atau bertentangan satu sama lain.

### Jenis-jenis Integritas:
1. **Entity Integrity** → memastikan setiap baris data memiliki identitas unik (*Primary Key*).  
2. **Referential Integrity** → menjaga konsistensi hubungan antar tabel (*Foreign Key*).  
3. **Domain Integrity** → memastikan nilai data sesuai tipe dan batasan (*Constraint*).  
4. **User-Defined Integrity** → aturan khusus sesuai kebutuhan bisnis (*Trigger, Check, Function*).

> 🧩 Contoh: Mahasiswa tidak bisa memiliki NIM ganda, dan NIM yang diinput di tabel `Nilai` harus ada di tabel `Mahasiswa`.

---

## 6.2 Penerapan Integritas Data dalam SQL

### 🔹 Primary Key
Menjamin setiap baris data unik.
```sql
CREATE TABLE Mahasiswa (
  NIM CHAR(8) PRIMARY KEY,
  Nama VARCHAR(100)
);
```

### 🔹 Foreign Key
Menjaga hubungan antar tabel agar referensi valid.
```sql
CREATE TABLE Nilai (
  NIM CHAR(8),
  KodeMK CHAR(5),
  Nilai INT,
  FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);
```

### 🔹 Constraint CHECK
Membatasi nilai yang dapat dimasukkan.
```sql
ALTER TABLE Nilai ADD CONSTRAINT CekNilai CHECK (Nilai BETWEEN 0 AND 100);
```

### 🔹 UNIQUE Constraint
Menjamin kolom tertentu tidak memiliki nilai duplikat.
```sql
ALTER TABLE Mahasiswa ADD CONSTRAINT UnikEmail UNIQUE (Email);
```

---

## 6.3 Integritas Transaksi
Selain menjaga struktur data, integritas juga dijaga melalui transaksi yang mematuhi prinsip **ACID**:

| Prinsip | Arti | Contoh |
|----------|------|---------|
| **Atomicity** | Semua operasi dalam transaksi harus selesai semua atau gagal semua. | Transfer uang: debit & kredit harus sukses bersama. |
| **Consistency** | Data tetap valid setelah transaksi. | Saldo akhir = saldo awal - debit + kredit. |
| **Isolation** | Transaksi berjalan terpisah tanpa saling ganggu. | Dua pengguna bisa transfer bersamaan tanpa konflik. |
| **Durability** | Data tersimpan permanen setelah `COMMIT`. | Data tetap ada meski server mati. |

---

## 6.4 Pengertian Keamanan Data
**Keamanan data (Data Security)** adalah upaya untuk melindungi data dari akses tidak sah, penyalahgunaan, atau kerusakan.  
Keamanan mencakup tiga aspek utama: **Confidentiality, Integrity, Availability (CIA)**.

| Aspek | Deskripsi |
|--------|------------|
| **Confidentiality** | Data hanya dapat diakses oleh pihak berwenang. |
| **Integrity** | Data tetap utuh dan tidak diubah tanpa izin. |
| **Availability** | Data tersedia saat dibutuhkan oleh pengguna sah. |

---

## 6.5 Lapisan Keamanan pada Database
1. **Autentikasi (Authentication)** → memastikan identitas pengguna yang mengakses database.  
2. **Otorisasi (Authorization)** → menentukan hak akses pengguna (read, write, execute).  
3. **Enkripsi (Encryption)** → melindungi data dari pencurian saat disimpan atau dikirim.  
4. **Audit & Logging** → mencatat semua aktivitas pengguna untuk pelacakan.  
5. **Backup & Recovery** → menjaga data tetap tersedia setelah kegagalan sistem.

---

## 6.6 Contoh Implementasi Keamanan Database

### 🔹 Membuat User dan Memberikan Akses
```sql
CREATE USER 'adminkampus'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON kampus.* TO 'adminkampus'@'localhost';
FLUSH PRIVILEGES;
```

### 🔹 Memberikan Akses Terbatas
```sql
CREATE USER 'dosen'@'localhost' IDENTIFIED BY 'dosen123';
GRANT SELECT, INSERT ON kampus.mahasiswa TO 'dosen'@'localhost';
```

### 🔹 Mencabut Hak Akses
```sql
REVOKE INSERT ON kampus.mahasiswa FROM 'dosen'@'localhost';
```

---

## 6.7 Backup dan Recovery
**Backup** adalah proses membuat salinan data untuk mencegah kehilangan.  
**Recovery** adalah proses mengembalikan data dari salinan (backup) saat terjadi kerusakan.

### Jenis Backup:
| Jenis | Deskripsi |
|--------|-----------|
| **Full Backup** | Menyalin seluruh database. |
| **Incremental Backup** | Menyalin hanya data yang berubah sejak backup terakhir. |
| **Differential Backup** | Menyalin semua perubahan sejak full backup terakhir. |

### Contoh Backup di MySQL:
```bash
mysqldump -u root -p kampus > backup_kampus.sql
```

### Contoh Restore Database:
```bash
mysql -u root -p kampus < backup_kampus.sql
```

> 💾 *Backup terjadwal setiap hari dapat menyelamatkan sistem dari kehilangan total.*

---

## 6.8 Audit dan Logging
Audit trail mencatat semua aktivitas penting yang dilakukan pengguna.  
Berguna untuk memantau siapa yang mengubah data, kapan, dan dari mana.

**Contoh:**
- Menyimpan log login pengguna.  
- Mencatat query yang dijalankan oleh user tertentu.  
- Melacak perubahan data sensitif.

> 🕵️ *Audit membantu deteksi pelanggaran dan memperkuat keamanan sistem.*

---

## 6.9 Ancaman terhadap Keamanan Data
| Jenis Ancaman | Contoh |
|----------------|---------|
| **Unauthorized Access** | Pengguna tidak sah mengakses data. |
| **SQL Injection** | Menyisipkan perintah SQL berbahaya melalui input pengguna. |
| **Data Leakage** | Kebocoran data sensitif akibat kelalaian. |
| **Malware Attack** | Perusakan sistem melalui virus atau trojan. |
| **Human Error** | Kesalahan manusia yang menyebabkan kehilangan data. |

---

## 6.10 Praktik Terbaik Keamanan Database
1. Gunakan **password kuat** dan enkripsi koneksi database (SSL/TLS).  
2. Terapkan **least privilege principle** (hak akses minimum).  
3. Lakukan **update rutin** pada DBMS untuk menutup celah keamanan.  
4. Gunakan **firewall** untuk membatasi koneksi tidak sah.  
5. Aktifkan **log audit** untuk memantau aktivitas mencurigakan.  
6. Lakukan **backup otomatis** secara berkala.

---

## 6.11 Kesimpulan
Integritas dan keamanan adalah dua pilar utama dari database yang handal.  
Database yang aman dan konsisten memastikan data:
- Tetap akurat dan valid.  
- Hanya dapat diakses oleh pengguna sah.  
- Tersedia kapan pun dibutuhkan.  

> 🔒 *“Data adalah aset berharga. Jaga integritasnya, lindungi keamanannya.”*

---

📚 **Selanjutnya:** BAB 7 – Transaksi dan Konkurensi
