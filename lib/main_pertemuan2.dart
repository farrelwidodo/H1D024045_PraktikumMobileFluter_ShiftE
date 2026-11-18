import 'package:flutter/material.dart';
import 'package:tokokita/hello_world.dart';
import 'package:tokokita/column_widget.dart';
import 'package:tokokita/row_widget.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter Pertama",
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // Silakan ganti baris home di bawah ini sesuai tugas yang ingin ditampilkan / discreenshot:
      // home: const HelloWorld(),     // Poin 7: Hello World
      // home: const ColumnWidget(),   // Poin 8: Kolom Widget
      // home: const RowWidget(),      // Poin 9: Row Widget
      // home: const ProdukForm(),     // Poin 10: Form Produk & Detail Produk
      home: const ProdukPage(),        // Poin 11: ListView Data Produk
    );
  }
}
