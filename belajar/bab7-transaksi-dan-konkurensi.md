# 🔁 BAB 7 – TRANSAKSI DAN KONKURENSI

## 7.1 Pengertian Transaksi
**Transaksi (Transaction)** adalah satu kesatuan aktivitas pada database yang harus dijalankan sepenuhnya atau dibatalkan seluruhnya agar data tetap konsisten.  
Setiap transaksi biasanya mencakup satu atau beberapa operasi SQL (INSERT, UPDATE, DELETE, dll).

> 💡 Contoh: proses transfer uang dari rekening A ke B — jika debit berhasil tapi kredit gagal, maka seluruh transaksi harus dibatalkan (ROLLBACK).

---

## 7.2 Karakteristik Transaksi – Prinsip ACID
Agar transaksi dianggap valid, sistem database harus memenuhi empat prinsip **ACID**:

| Komponen | Arti | Penjelasan |
|-----------|------|-------------|
| **Atomicity** | Tidak terbagi | Semua operasi dalam transaksi harus selesai semua atau gagal semua. |
| **Consistency** | Konsisten | Transaksi harus menjaga validitas aturan database. |
| **Isolation** | Terpisah | Transaksi tidak boleh saling memengaruhi satu sama lain. |
| **Durability** | Permanen | Data yang sudah dikomit tetap tersimpan walau sistem gagal. |

---

## 7.3 Contoh Transaksi SQL
```sql
START TRANSACTION;

UPDATE Akun SET Saldo = Saldo - 100000 WHERE ID = 1;
UPDATE Akun SET Saldo = Saldo + 100000 WHERE ID = 2;

COMMIT;   -- Menyimpan transaksi jika semua perintah sukses
-- atau
ROLLBACK; -- Membatalkan transaksi jika ada kesalahan
```

> 🎯 Transaksi memastikan integritas dan konsistensi data walaupun sistem mengalami gangguan.

---

## 7.4 Jenis-Jenis Transaksi
1. **Single Transaction** → satu operasi, contohnya `INSERT` tunggal.  
2. **Batch Transaction** → serangkaian operasi yang dijalankan berurutan.  
3. **Nested Transaction** → transaksi di dalam transaksi lain (umum di sistem kompleks).  
4. **Distributed Transaction** → transaksi lintas beberapa server database.

---

## 7.5 Konsep Konkurensi (Concurrency)
**Konkurensi** terjadi ketika banyak pengguna atau proses mengakses database secara bersamaan.  
Tujuannya: meningkatkan performa dan efisiensi sistem multi-user.

Namun, jika tidak dikelola dengan baik, dapat menimbulkan masalah seperti:
- Inkonsistensi data  
- Deadlock  
- Lost update  
- Dirty read

---

## 7.6 Masalah Umum pada Konkurensi

| Jenis Masalah | Deskripsi | Contoh |
|----------------|------------|---------|
| **Lost Update** | Dua transaksi menulis data pada saat bersamaan sehingga perubahan salah satunya hilang. | Dua user mengubah stok barang bersamaan. |
| **Dirty Read** | Membaca data dari transaksi lain yang belum dikomit. | User membaca saldo sementara yang belum final. |
| **Non-Repeatable Read** | Nilai data berubah di antara dua pembacaan dalam satu transaksi. | Data dibaca dua kali, tapi hasilnya berbeda karena ada transaksi lain. |
| **Phantom Read** | Jumlah baris hasil query berubah karena transaksi lain menambah/menghapus data. | Hasil `SELECT COUNT(*)` berubah tanpa alasan yang jelas. |

---

## 7.7 Isolation Level (Tingkat Isolasi)
Untuk mencegah masalah konkurensi, DBMS menyediakan **tingkat isolasi transaksi**.  
Semakin tinggi isolasi → semakin aman, tapi performa bisa menurun.

| Level Isolasi | Mencegah | Contoh Sintaks |
|----------------|-----------|----------------|
| **READ UNCOMMITTED** | Tidak ada (bisa baca data belum dikomit). | `SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;` |
| **READ COMMITTED** | Dirty read. | `SET TRANSACTION ISOLATION LEVEL READ COMMITTED;` |
| **REPEATABLE READ** | Dirty & non-repeatable read. | `SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;` |
| **SERIALIZABLE** | Semua masalah konkurensi. | `SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;` |

> 🧠 Semakin tinggi tingkat isolasi, semakin kuat integritas data tapi performa query bisa melambat.

---

## 7.8 Deadlock
**Deadlock** terjadi ketika dua transaksi saling menunggu sumber daya yang dikunci satu sama lain dan tidak pernah selesai.

### Contoh Kasus:
- Transaksi A mengunci tabel `Mahasiswa`, menunggu `Nilai`.  
- Transaksi B mengunci tabel `Nilai`, menunggu `Mahasiswa`.

Keduanya akan saling menunggu tanpa akhir → *deadlock*.

### Solusi:
- Gunakan urutan akses tabel yang konsisten.  
- Terapkan *timeout* pada transaksi.  
- Gunakan *deadlock detection* yang disediakan DBMS.

---

## 7.9 Concurrency Control (Pengendalian Konkurensi)
Tujuan utamanya adalah memastikan transaksi paralel berjalan aman tanpa merusak integritas data.

### Teknik Umum:
1. **Locking (Penguncian)**  
   - *Shared Lock (S)* → untuk operasi baca.  
   - *Exclusive Lock (X)* → untuk operasi tulis.  

2. **Timestamp Ordering**  
   - Setiap transaksi diberi cap waktu.  
   - Sistem menolak transaksi yang konflik berdasarkan urutan waktu.  

3. **Optimistic Concurrency Control**  
   - Transaksi berjalan tanpa kunci, baru diperiksa di akhir apakah ada konflik.  

4. **Multiversion Concurrency Control (MVCC)**  
   - DBMS menyimpan beberapa versi data agar pembacaan tidak terganggu oleh transaksi lain.  
   - Digunakan oleh PostgreSQL dan Oracle.

---

## 7.10 Recovery System
**Recovery** adalah mekanisme untuk mengembalikan database ke keadaan konsisten setelah kegagalan.

### Jenis Kegagalan:
- **Transaction Failure** → kesalahan dalam satu transaksi.  
- **System Crash** → server mati atau restart mendadak.  
- **Media Failure** → kerusakan disk fisik.

### Teknik Pemulihan:
- **Checkpoint** → menyimpan status sistem terakhir yang stabil.  
- **Log File (Write-Ahead Logging)** → mencatat setiap perubahan sebelum dijalankan.  
- **Rollback / Redo** → membatalkan atau menjalankan ulang transaksi dari log.

---

## 7.11 Contoh Transaksi Aman
```sql
SET AUTOCOMMIT = 0;
START TRANSACTION;

UPDATE stok SET jumlah = jumlah - 1 WHERE id_barang = 10;
INSERT INTO penjualan (id_barang, tanggal) VALUES (10, NOW());

COMMIT;
```
> ⚙️ Jika salah satu perintah gagal, sistem otomatis melakukan `ROLLBACK`.

---

## 7.12 Kesimpulan
Transaksi dan konkurensi adalah aspek penting dalam sistem database multi-user.  
Keduanya memastikan:
- Data tetap **konsisten**, walaupun banyak pengguna aktif bersamaan.  
- Operasi transaksi berjalan **aman dan efisien**.  
- Database dapat **pulih dengan cepat** jika terjadi gangguan.

> 🔁 *“Sistem database yang baik bukan hanya menyimpan data, tapi juga menjaga kejujurannya di tengah ribuan transaksi.”*

---

📚 **Selanjutnya:** [BAB 8 - Optimisasi dan Indeks →](./bab8-optimisasi-dan-indeks.md)
