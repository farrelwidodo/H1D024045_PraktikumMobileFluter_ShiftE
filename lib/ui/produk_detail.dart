import 'package:flutter/material.dart';
import '../blocs/produk_bloc.dart';
import '../models/produk.model.dart';
import 'produk_form.dart';
import 'produk_page.dart';

class ProdukDetail extends StatefulWidget {
  final ProdukData? produk;

  const ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kode: ${widget.produk!.kodeProduk}",
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10),
              Text(
                "Nama: ${widget.produk!.namaProduk}",
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10),
              Text(
                "Harga: Rp. ${widget.produk!.harga}",
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 30),
              _tombolHapusEdit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(
                  produk: widget.produk!,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        // Tombol Hapus
        OutlinedButton(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
          child: const Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        // Tombol Hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            ProdukBloc.deleteProduk(id: widget.produk!.id!).then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const ProdukPage()),
                (route) => false,
              );
            }).catchError((error) {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Gagal"),
                  content: Text("Terjadi kesalahan: $error"),
                  actions: [
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            });
          },
        ),
        // Tombol Batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
