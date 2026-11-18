class ProdukModel {
  int? code;
  bool? status;
  List<ProdukData>? data;

  ProdukModel({this.code, this.status, this.data});

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      code: json['code'],
      status: json['status'],
      data: json['data'] != null
          ? List<ProdukData>.from(json['data'].map((v) => ProdukData.fromJson(v)))
          : null,
    );
  }
}

class ProdukData {
  String? id;
  String? kodeProduk;
  String? namaProduk;
  String? harga;

  ProdukData({this.id, this.kodeProduk, this.namaProduk, this.harga});

  factory ProdukData.fromJson(Map<String, dynamic> json) {
    return ProdukData(
      id: json['id']?.toString(),
      kodeProduk: json['kode_produk']?.toString(),
      namaProduk: json['nama_produk']?.toString(),
      harga: json['harga']?.toString(),
    );
  }
}

