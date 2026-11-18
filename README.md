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
- **Widget Statis (`StatelessWidget`)**: Digunakan pada `HelloWorld`, `ColumnWidget`, `RowWidget`, dan `ProdukDetail` untuk menampilkan elemen UI dengan data tetap.
- **Widget Dinamis (`StatefulWidget`)**: Digunakan pada `ProdukForm` (menggunakan `TextEditingController` untuk menangani input teks) dan `ProdukPage` (menampilkan daftar produk).
- **Layout & Tampilan**: Memanfaatkan `Scaffold`, `AppBar`, `Column`, `Row`, `TextField`, `ElevatedButton`, serta `ListView` dan `Card` untuk menyusun antarmuka aplikasi.
- **Navigasi & Passing Data**: Menggunakan `Navigator.push` dan `MaterialPageRoute` untuk berpindah dari halaman formulir ke halaman detail sekaligus mengirimkan data produk.

---

## Bukti Pengerjaan (Screenshot)

![Tugas Pertemuan 2](TugasPertemuan2.png)

---

## Cara Menjalankan Proyek
1. Jalankan `flutter pub get` di terminal.
2. Tentukan halaman yang ingin ditampilkan pada properti `home` di file [lib/main.dart](lib/main.dart).
3. Jalankan aplikasi dengan menekan tombol **F5** atau perintah `flutter run`.

---

## Pertemuan 3
Aplikasi ini dibuat untuk mempelajari navigasi antar halaman (routes) pada Flutter, meliputi pembuatan halaman login dengan validasi sederhana, penyimpanan username menggunakan local storage (`shared_preferences`), halaman beranda yang menampilkan username yang tersimpan, serta side menu (`Drawer`) untuk berpindah ke halaman Home dan About.

---

## Pertemuan 4
Aplikasi ini dibuat untuk mempelajari integrasi Flutter dengan REST API (`toko-api` CodeIgniter) menggunakan package `http`, meliputi pembuatan helper koneksi API (`api.dart` dan `api_url.dart`), model data (`RegistrasiModel`, `LoginModel`, `ProdukModel`), lapisan bisnis (`RegistrasiBloc`, `LoginBloc`, `ProdukBloc`), serta antarmuka lengkap untuk Registrasi, Login, Logout, dan operasi CRUD Produk (List Produk, Tambah Produk, Detail Produk, Ubah Produk, dan Hapus Produk).

---

## Pertemuan 5
Aplikasi ini dikembangkan untuk menambahkan manajemen sesi autentikasi berbasis token menggunakan `shared_preferences` (`user_info.dart`), penanganan error HTTP terstruktur (`app_exception.dart`), pengiriman header `Authorization: Bearer <token>` otomatis beserta method `DELETE` pada helper API (`api.dart`), pengecekan status login otomatis saat aplikasi dibuka di `main.dart`, fitur `LogoutBloc`, serta komponen dialog kustom (`SuccessDialog` dan `WarningDialog`) untuk memberikan umpan balik kepada pengguna pada setiap aksi Registrasi, Login, dan CRUD Produk.
