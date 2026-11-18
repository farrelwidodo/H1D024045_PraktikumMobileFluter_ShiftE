import 'package:flutter/material.dart';
import 'package:tokokita/blocs/produk_bloc.dart';
import 'package:tokokita/models/produk.model.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/widget/warning_dialog.dart';

class ProdukForm extends StatefulWidget {
  final ProdukData? produk;

  const ProdukForm({super.key, this.produk});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  String judul = "TAMBAH PRODUK";
  String tombolSubmit = "SIMPAN";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  void isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk ?? '';
        _namaProdukTextboxController.text = widget.produk!.namaProduk ?? '';
        _hargaProdukTextboxController.text = widget.produk!.harga ?? '';
      });
    } else {
      judul = "TAMBAH PRODUK";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                const SizedBox(height: 20),
                _buttonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return OutlinedButton(
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(tombolSubmit),
      onPressed: () {
        var validate = _formkey.currentState!.validate();
        if (validate) {
          if (!isLoading) {
            if (widget.produk != null) {
              // Kondisi Update
              _ubah();
            } else {
              // Kondisi Simpan/Tambah
              _simpan();
            }
          }
        }
      },
    );
  }

  void _simpan() {
    setState(() {
      isLoading = true;
    });
    ProdukData createProduk = ProdukData(
      kodeProduk: _kodeProdukTextboxController.text,
      namaProduk: _namaProdukTextboxController.text,
      harga: _hargaProdukTextboxController.text,
    );

    ProdukBloc.addProduk(produk: createProduk).then((value) {
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const ProdukPage()),
        (route) => false,
      );
    }, onError: (error) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
          description: "Simpan gagal, silahkan coba lagi",
        ),
      );
    }).whenComplete(() {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    });
  }

  void _ubah() {
    setState(() {
      isLoading = true;
    });
    ProdukData updateProduk = ProdukData(
      id: widget.produk!.id,
      kodeProduk: _kodeProdukTextboxController.text,
      namaProduk: _namaProdukTextboxController.text,
      harga: _hargaProdukTextboxController.text,
    );

    ProdukBloc.updateProduk(produk: updateProduk).then((value) {
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const ProdukPage()),
        (route) => false,
      );
    }, onError: (error) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
          description: "Permintaan ubah data gagal, silahkan coba lagi",
        ),
      );
    }).whenComplete(() {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    });
  }
}
