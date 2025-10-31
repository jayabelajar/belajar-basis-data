# 🧠 BAB 1 – PENGENALAN BASIS DATA

## 1.1 Pengertian Basis Data
**Basis Data (Database)** adalah kumpulan data yang terorganisir secara sistematis agar mudah diakses, dikelola, dan diperbarui.  
Basis data digunakan untuk menyimpan informasi yang saling berhubungan sehingga dapat diolah menjadi data yang bermakna bagi pengguna.

**Contoh sederhana:**
- Sistem akademik: menyimpan data mahasiswa, dosen, nilai.  
- E-commerce: menyimpan data produk, pelanggan, dan transaksi.  
- Media sosial: menyimpan data pengguna, postingan, dan komentar.

> 💡 Tanpa database, hampir semua sistem modern tidak akan dapat berjalan dengan efisien.

---

## 1.2 Fungsi Basis Data
1. **Mengelola Data Secara Terpusat** – Semua data tersimpan dalam satu sistem.  
2. **Mengurangi Redundansi Data** – Mencegah data ganda yang tidak perlu.  
3. **Menjaga Integritas dan Konsistensi** – Memastikan data tetap valid.  
4. **Meningkatkan Keamanan Data** – Akses pengguna dapat diatur sesuai haknya.  
5. **Mendukung Keputusan** – Data yang terstruktur membantu proses analisis.

---

## 1.3 Komponen Sistem Basis Data
| Komponen | Deskripsi |
|-----------|------------|
| **Data** | Sekumpulan fakta yang disimpan secara elektronik. |
| **Hardware** | Perangkat keras tempat penyimpanan data (server, storage). |
| **Software (DBMS)** | Aplikasi untuk mengelola data (MySQL, PostgreSQL, Oracle). |
| **User** | Orang yang berinteraksi dengan sistem (admin, programmer, end-user). |

---

## 1.4 Jenis Pengguna Database
- **Database Administrator (DBA)** – mengelola struktur, izin akses, dan performa.  
- **Database Designer** – merancang struktur logis database (ERD, tabel, relasi).  
- **Application Developer** – membuat aplikasi yang berinteraksi dengan database.  
- **End User** – pengguna akhir yang hanya mengakses data sesuai kebutuhan.

---

## 1.5 Contoh Struktur Database Sederhana
Berikut contoh implementasi database mahasiswa menggunakan **MySQL**:

```sql
CREATE TABLE mahasiswa (
  nim CHAR(8) PRIMARY KEY,
  nama VARCHAR(100),
  prodi VARCHAR(50),
  angkatan YEAR
);

INSERT INTO mahasiswa (nim, nama, prodi, angkatan)
VALUES 
('23010101', 'Budi Santoso', 'Teknik Informatika', 2023),
('23010102', 'Rina Dewi', 'Sistem Informasi', 2023);

SELECT * FROM mahasiswa;
```

> 🔍 Output:
| nim | nama | prodi | angkatan |
|------|------|--------|-----------|
| 23010101 | Budi Santoso | Teknik Informatika | 2023 |
| 23010102 | Rina Dewi | Sistem Informasi | 2023 |

---

## 1.6 Manfaat Penggunaan Basis Data
- **Efisiensi Penyimpanan**: data besar dapat disimpan tanpa duplikasi.  
- **Kemudahan Akses**: pengguna dapat mencari atau memfilter data dengan cepat.  
- **Konsistensi**: perubahan data terpusat memengaruhi semua pengguna.  
- **Keamanan**: akses dapat diatur berdasarkan peran pengguna.  
- **Skalabilitas**: mudah dikembangkan untuk sistem yang lebih besar.

---

## 1.7 Terminologi Penting
| Istilah | Arti |
|----------|------|
| **Data** | Fakta mentah yang belum diolah. |
| **Informasi** | Data yang telah diolah sehingga bermakna. |
| **Database** | Kumpulan data yang saling berhubungan. |
| **DBMS** | Sistem untuk mengelola dan memanipulasi database. |
| **Record** | Satu baris data dalam tabel. |
| **Field** | Kolom yang berisi satu jenis data. |

---

## 1.8 Kesimpulan
Basis data adalah fondasi dari hampir semua sistem informasi modern.  
Dengan pemahaman yang baik tentang konsep, fungsi, dan komponen dasarnya, kita dapat membangun sistem yang lebih efisien, aman, dan mudah dikembangkan.

> 🧩 **Ingat:** “Data yang baik menghasilkan keputusan yang tepat.”

---

📚 **Selanjutnya:** [BAB 2 – Model dan Arsitektur Basis Data →](./bab2-model-dan-arsitektur.md)
