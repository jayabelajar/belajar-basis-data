# 🧱 BAB 3 – PERANCANGAN BASIS DATA

## 3.1 Pengertian Perancangan Basis Data
**Perancangan Basis Data** adalah proses untuk menentukan bagaimana data akan disimpan, diorganisir, dan dihubungkan dalam suatu sistem.  
Tujuannya agar data tersimpan efisien, mudah diakses, serta tetap konsisten dan aman.

Perancangan yang baik harus menghasilkan:
- Struktur tabel yang efisien.  
- Relasi antar data yang jelas.  
- Minim duplikasi dan anomali data.  
- Mudah dipelihara dan dikembangkan.

> 💡 *Database yang baik dimulai dari desain yang matang.*

---

## 3.2 Tahapan Perancangan Basis Data
Perancangan database dilakukan secara bertahap dari konsep hingga implementasi.

### 🔹 1. Analisis Kebutuhan
Menentukan data apa saja yang diperlukan oleh sistem.  
Langkah-langkah:
- Identifikasi entitas utama (misal: Mahasiswa, Dosen, MataKuliah).  
- Tentukan atribut yang dimiliki oleh setiap entitas.  
- Tentukan hubungan antar entitas.

### 🔹 2. Desain Konseptual
Membuat model konseptual menggunakan **ERD (Entity Relationship Diagram)**.  
Hasil tahap ini berupa:
- Entitas, atribut, dan relasi antar entitas.  
- Kardinalitas (One-to-One, One-to-Many, Many-to-Many).

### 🔹 3. Desain Logis
Mengonversi ERD menjadi tabel-tabel relasional.  
- Tentukan **Primary Key (PK)** dan **Foreign Key (FK)**.  
- Definisikan tipe data dan constraint.

### 🔹 4. Desain Fisik
Menentukan bagaimana data akan disimpan secara fisik:
- Struktur file database.  
- Indeks dan partisi tabel.  
- Pengaturan performa & storage.

---

## 3.3 Entity Relationship Diagram (ERD)
ERD adalah model konseptual yang menggambarkan hubungan antar entitas.  
Berfungsi untuk mempermudah perancangan logis dan fisik database.

### Contoh ERD Teks:
```
[Mahasiswa]
- NIM (PK)
- Nama
- Prodi

[Dosen]
- ID_Dosen (PK)
- Nama
- Keahlian

[MataKuliah]
- KodeMK (PK)
- NamaMK
- SKS

[Relasi]
Dosen (1) —— (N) MataKuliah
Mahasiswa (N) —— (N) MataKuliah
```

---

## 3.4 Normalisasi Data
**Normalisasi** adalah proses pengelompokan atribut dan relasi agar struktur tabel efisien serta bebas dari redundansi.  
Normalisasi dilakukan bertahap dari **1NF** hingga **3NF** (atau lebih tinggi jika perlu).

| Bentuk Normal | Tujuan | Aturan |
|----------------|---------|--------|
| **1NF (First Normal Form)** | Menghapus data berulang dalam kolom. | Setiap atribut bernilai tunggal. |
| **2NF (Second Normal Form)** | Menghilangkan ketergantungan parsial. | Semua atribut non-key bergantung penuh pada PK. |
| **3NF (Third Normal Form)** | Menghilangkan ketergantungan transitif. | Atribut non-key tidak bergantung pada atribut non-key lainnya. |

> 🎯 Hasil normalisasi: struktur tabel yang efisien dan mudah diperluas tanpa anomali.

---

## 3.5 Contoh Proses Normalisasi
### Kasus Awal (Tabel Tidak Normal):
| NIM | Nama | Mata Kuliah | Dosen |
|------|------|--------------|--------|
| 23010101 | Budi | Basis Data | Ibu Sari |
| 23010101 | Budi | Algoritma | Pak Andi |

👉 Masih ada **pengulangan data mahasiswa** dan **mata kuliah**.

---

### Setelah Normalisasi:
**Tabel Mahasiswa**
| NIM (PK) | Nama |
|-----------|------|
| 23010101 | Budi |

**Tabel Dosen**
| ID_Dosen (PK) | Nama_Dosen |
|----------------|-------------|
| D01 | Ibu Sari |
| D02 | Pak Andi |

**Tabel MataKuliah**
| KodeMK (PK) | NamaMK | ID_Dosen (FK) |
|---------------|----------|---------------|
| MK01 | Basis Data | D01 |
| MK02 | Algoritma | D02 |

**Tabel Mengambil**
| NIM (FK) | KodeMK (FK) |
|------------|--------------|
| 23010101 | MK01 |
| 23010101 | MK02 |

Sekarang data lebih **terstruktur, efisien, dan bebas duplikasi.**

---

## 3.6 Contoh Implementasi SQL
Berikut contoh hasil desain database dalam bentuk SQL:

```sql
CREATE TABLE Mahasiswa (
  NIM CHAR(8) PRIMARY KEY,
  Nama VARCHAR(100)
);

CREATE TABLE Dosen (
  ID_Dosen CHAR(4) PRIMARY KEY,
  Nama_Dosen VARCHAR(100)
);

CREATE TABLE MataKuliah (
  KodeMK CHAR(5) PRIMARY KEY,
  NamaMK VARCHAR(100),
  SKS INT,
  ID_Dosen CHAR(4),
  FOREIGN KEY (ID_Dosen) REFERENCES Dosen(ID_Dosen)
);

CREATE TABLE Mengambil (
  NIM CHAR(8),
  KodeMK CHAR(5),
  PRIMARY KEY (NIM, KodeMK),
  FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM),
  FOREIGN KEY (KodeMK) REFERENCES MataKuliah(KodeMK)
);
```

---

## 3.7 Denormalisasi
**Denormalisasi** dilakukan untuk meningkatkan performa query dengan menggabungkan tabel-tabel yang sering diakses bersama.  
Namun, ini bisa menyebabkan redundansi data, jadi harus dilakukan dengan hati-hati.

> ⚠️ Gunakan denormalisasi hanya jika performa lebih penting daripada efisiensi penyimpanan.

---

## 3.8 Prinsip Desain Database yang Baik
1. Gunakan **Primary Key** yang unik dan stabil.  
2. Minimalkan **redundansi data**.  
3. Gunakan **Foreign Key** untuk menjaga referensial integritas.  
4. Lakukan **indexing** untuk mempercepat pencarian.  
5. Dokumentasikan setiap tabel, relasi, dan constraint.  
6. Pisahkan data statis dan dinamis jika diperlukan.

---

## 3.9 Kesimpulan
Perancangan basis data yang baik akan menghasilkan sistem yang:
- Konsisten, efisien, dan mudah dikembangkan.  
- Bebas anomali dan duplikasi.  
- Siap diimplementasikan ke dalam DBMS apa pun.

> 🧠 *“Desain database yang baik adalah seni menyusun data agar logika dan efisiensi berjalan seimbang.”*

---

📚 **Selanjutnya:** BAB 4 – Sistem Manajemen Basis Data (DBMS)
