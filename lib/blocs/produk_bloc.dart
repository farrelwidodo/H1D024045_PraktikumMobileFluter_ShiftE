import 'dart:convert';
import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/models/produk.model.dart';

class ProdukBloc {
  // 1. Ambil Semua Daftar Produk (GET)
  static Future<List<ProdukData>> getProduk() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    var listProduk = ProdukModel.fromJson(jsonObj);
    return listProduk.data ?? [];
  }

  // 2. Tambah Produk Baru (POST)
  static Future<bool> addProduk({ProdukData? produk}) async {
    String apiUrl = ApiUrl.createProduk;
    var body = {
      "kode_produk": produk!.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.harga.toString(),
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'] == true;
  }

  // 3. Ubah / Update Produk (POST/PUT)
  static Future<bool> updateProduk({required ProdukData produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id!);
    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.harga.toString(),
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'] == true || jsonObj['data'] == true;
  }

  // 4. Hapus Produk (DELETE)
  static Future<bool> deleteProduk({required String id}) async {
    String apiUrl = ApiUrl.deleteProduk(id);
    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['status'] == true ||
        jsonObj['data'] == true;
  }
}
