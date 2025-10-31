# 🧩 BAB 2 – MODEL DAN ARSITEKTUR BASIS DATA

## 2.1 Pengertian Model Data
**Model data** adalah cara untuk menggambarkan struktur, hubungan, dan aturan antar data di dalam basis data.  
Model ini berfungsi sebagai **rancangan konseptual** sebelum database dibangun secara fisik oleh DBMS.

Tiga komponen utama model data:
1. **Struktur Data** → mendefinisikan bagaimana data disimpan (entitas, tabel, atribut).  
2. **Operasi Data** → mendefinisikan bagaimana data dimanipulasi (INSERT, UPDATE, DELETE, SELECT).  
3. **Kendala Data (Constraints)** → aturan yang menjaga keakuratan dan konsistensi data.

> 🎯 Model data membantu pengembang memahami bagaimana data saling terhubung secara logis sebelum diterapkan di sistem nyata.

---

## 2.2 Jenis-Jenis Model Data
| Jenis Model | Ciri Utama | Contoh Implementasi |
|--------------|-------------|---------------------|
| **Model Hierarki** | Struktur data seperti pohon, 1 parent bisa memiliki banyak child. | IMS (IBM) |
| **Model Jaringan** | Data saling terhubung dalam relasi many-to-many. | IDMS |
| **Model Relasional** | Data disimpan dalam tabel (rows & columns). | MySQL, PostgreSQL |
| **Model Berorientasi Objek** | Data direpresentasikan sebagai objek dengan atribut & metode. | ObjectDB, db4o |
| **Model NoSQL** | Tidak menggunakan tabel, cocok untuk big data & data tidak terstruktur. | MongoDB, Redis, Cassandra |

> 💡 Model **Relasional** paling umum digunakan karena mudah dipahami dan didukung luas oleh berbagai DBMS.

---

## 2.3 Entity Relationship (ER) Model
**ER Model (Entity-Relationship Model)** digunakan untuk menggambarkan hubungan antar entitas di dalam database.  
Biasanya divisualisasikan dalam bentuk diagram yang disebut **ERD (Entity Relationship Diagram)**.

### Komponen Utama ER Model:
| Komponen | Deskripsi | Contoh |
|-----------|------------|--------|
| **Entity (Entitas)** | Objek nyata yang datanya disimpan. | Mahasiswa, Dosen |
| **Attribute (Atribut)** | Properti yang dimiliki entitas. | NIM, Nama, Prodi |
| **Relationship (Relasi)** | Hubungan antar entitas. | Mahasiswa mengambil Mata Kuliah |
| **Cardinality (Kardinalitas)** | Banyaknya hubungan antar entitas. | One-to-One, One-to-Many, Many-to-Many |

### Contoh Tekstual:
```
Mahasiswa (NIM, Nama, Prodi)
MataKuliah (KodeMK, NamaMK, SKS)
Relasi: Mahasiswa → Mengambil → MataKuliah (Many-to-Many)
```

---

## 2.4 Model Relasional (Relational Model)
Model ini merupakan model paling populer dan menjadi dasar dari sebagian besar DBMS modern.  
Semua data disimpan dalam **tabel dua dimensi** yang disebut *relation*.

### Konsep Dasar:
- **Tabel (Relation)** → tempat penyimpanan data.  
- **Baris (Tuple/Record)** → satu data lengkap dari entitas.  
- **Kolom (Field/Attribute)** → jenis data.  
- **Primary Key (PK)** → identitas unik dari tiap record.  
- **Foreign Key (FK)** → kunci penghubung antar tabel.

### Contoh Implementasi:
```sql
CREATE TABLE Dosen (
  id_dosen INT PRIMARY KEY,
  nama VARCHAR(100),
  keahlian VARCHAR(50)
);

CREATE TABLE Mahasiswa (
  nim CHAR(8) PRIMARY KEY,
  nama VARCHAR(100),
  prodi VARCHAR(50),
  id_dosen INT,
  FOREIGN KEY (id_dosen) REFERENCES Dosen(id_dosen)
);
```

Relasi di atas menunjukkan bahwa **satu dosen bisa membimbing banyak mahasiswa** (One-to-Many Relationship).

---

## 2.5 Arsitektur Basis Data
Arsitektur menggambarkan **bagaimana data disimpan, diakses, dan diproses** dalam sistem basis data.  
Model arsitektur yang paling umum digunakan adalah **Three-Level Architecture (ANSI-SPARC)**.

### 1️⃣ Tingkat Eksternal (External Level)
- Pandangan data dari sudut pengguna akhir (*user view*).  
- Setiap pengguna bisa memiliki tampilan berbeda.  
  > Contoh: Mahasiswa hanya melihat nilai sendiri, sedangkan dosen bisa melihat seluruh daftar nilai kelasnya.

### 2️⃣ Tingkat Konseptual (Conceptual Level)
- Pandangan logis seluruh database organisasi.  
- Menjelaskan entitas, relasi, dan aturan bisnis.  
- Tidak tergantung pada implementasi fisik.

### 3️⃣ Tingkat Internal (Internal Level)
- Cara data disimpan secara fisik di media penyimpanan.  
- Mengatur indeks, struktur file, dan metode akses data.

> 🎯 Tujuan utama arsitektur tiga tingkat adalah untuk mencapai **Data Independence (Kemandirian Data)**, yaitu perubahan pada satu tingkat tidak memengaruhi tingkat lainnya.

---

## 2.6 Hubungan antara Model dan Arsitektur
| Aspek | Model Data | Arsitektur Database |
|--------|-------------|--------------------|
| **Fokus** | Representasi logis data | Organisasi penyimpanan data |
| **Digunakan oleh** | Perancang database | Administrator & sistem DBMS |
| **Hasil Utama** | ERD, tabel, atribut, relasi | Struktur fisik & kontrol akses |
| **Tujuan** | Memahami hubungan data | Mengoptimalkan kinerja sistem |

---

## 2.7 Contoh ERD Tekstual
```
[Mahasiswa]
- NIM (PK)
- Nama
- Prodi

[Dosen]
- ID_Dosen (PK)
- Nama
- Keahlian

[Relasi]
Dosen (1) —— (N) Mahasiswa
```
Artinya:  
Satu Dosen bisa membimbing banyak Mahasiswa (*one-to-many relationship*).

---

## 2.8 Kesimpulan
Model dan arsitektur basis data merupakan fondasi penting dalam membangun sistem database yang baik.  
- **Model Data** menjelaskan bagaimana data dihubungkan secara logis.  
- **Arsitektur Database** menjelaskan bagaimana data disimpan dan diakses secara fisik.  
Keduanya saling melengkapi untuk menghasilkan sistem database yang efisien, aman, dan mudah dikelola.

> 🧩 *“Desain database yang baik selalu dimulai dari model data yang jelas dan struktur yang terencana.”*

---

📚 **Selanjutnya:** [BAB 3 – Perancangan Basis Data →](./bab3-perancangan-basis-data.md)
