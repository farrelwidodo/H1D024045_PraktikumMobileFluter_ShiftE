import '../helpers/api.dart';
import '../helpers/api_url.dart';
import '../models/produk.model.dart';

class ProdukBloc {
  // 1. Ambil Semua Daftar Produk (GET)
  static Future<List<ProdukData>> getProduk() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    var jsonObj = response;
    var listProduk = ProdukModel.fromJson(jsonObj);
    return listProduk.data ?? [];
  }

  // 2. Tambah Produk Baru (POST)
  static Future<bool> addProduk({ProdukData? produk}) async {
    String apiUrl = ApiUrl.createProduk;
    var body = {
      "kode_produk": produk?.kodeProduk,
      "nama_produk": produk?.namaProduk,
      "harga": produk?.harga
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = response;
    return jsonObj['status'];
  }

  // 3. Ubah / Update Produk (PUT)
  static Future<bool> updateProduk({required ProdukData produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id!);
    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.harga
    };
    var response = await Api().post(apiUrl, body); // Jika helper menggunakan POST untuk update atau sesuaikan dengan method PUT
    var jsonObj = response;
    return jsonObj['status'];
  }

  // 4. Hapus Produk (DELETE)
  static Future<bool> deleteProduk({required String id}) async {
    String apiUrl = ApiUrl.deleteProduk(id);
    var response = await Api().get(apiUrl); // Atau gunakan method khusus delete jika ada di helper
    var jsonObj = response;
    return jsonObj['status'];
  }
}

