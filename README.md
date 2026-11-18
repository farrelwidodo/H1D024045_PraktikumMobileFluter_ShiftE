# Tugas Praktikum Pemrograman Mobile - Pertemuan 2

## Identitas Mahasiswa
- **Nama** : Farrel Wildan Widodo
- **NIM** : H1D024045
- **Shift KRS** : F
- **Shift Praktikum** : E
- **Tugas** : Pertemuan 2

---

## Deskripsi Aplikasi
Aplikasi ini dibuat untuk mempelajari dasar-dasar antarmuka (UI) pada Flutter, meliputi pembuatan teks dasar (*Hello World*), penyusunan tata letak elemen secara vertikal dan horizontal (*Column & Row*), pembuatan formulir input data produk beserta navigasi ke halaman detail, serta penyajian daftar katalog produk menggunakan kartu (*Card & ListView*).

---

## Fitur dan Widget yang Digunakan
- **Bahasa & Framework**: Dart & Flutter.
- **Widget Statis (StatelessWidget)**: Digunakan pada HelloWorld, ColumnWidget, RowWidget, dan ProdukDetail untuk menampilkan elemen UI dengan data tetap.
- **Widget Dinamis (StatefulWidget)**: Digunakan pada ProdukForm (menggunakan TextEditingController untuk menangani input teks) dan ProdukPage (menampilkan daftar produk).
- **Layout & Tampilan**: Memanfaatkan Scaffold, AppBar, Column, Row, TextField, ElevatedButton, serta ListView dan Card untuk menyusun antarmuka aplikasi.
- **Navigasi & Passing Data**: Menggunakan Navigator.push dan MaterialPageRoute untuk berpindah dari halaman formulir ke halaman detail sekaligus mengirimkan data produk.

---

## Bukti Pengerjaan (Screenshot)

![Tugas Pertemuan 2](TugasPertemuan2.png)

---

## Cara Menjalankan Proyek
1. Jalankan lutter pub get di terminal.
2. Tentukan halaman yang ingin ditampilkan pada properti home di file [lib/main.dart](lib/main.dart).
3. Jalankan aplikasi dengan menekan tombol **F5** atau perintah lutter run.
