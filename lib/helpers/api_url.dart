import 'package:flutter/foundation.dart' show kIsWeb;

class ApiUrl {
  static const String baseUrl = kIsWeb
      ? 'http://localhost/toko-api/public'
      : 'http://10.0.2.2/toko-api/public';

  static const String registrasi = '$baseUrl/registrasi';
  static const String login = '$baseUrl/login';
  static const String listProduk = '$baseUrl/produk';
  static const String createProduk = '$baseUrl/produk';

  static String updateProduk(Object id) {
    return '$baseUrl/produk/$id';
  }

  static String showProduk(Object id) {
    return '$baseUrl/produk/$id';
  }

  static String deleteProduk(Object id) {
    return '$baseUrl/produk/$id';
  }
}

