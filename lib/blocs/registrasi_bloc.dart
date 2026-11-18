import 'dart:convert';
import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/models/registrasi.model.dart';

class RegistrasiBloc {
  static Future<RegistrasiModel> registrasi({
    String? nama,
    String? email,
    String? password,
  }) async {
    String apiUrl = ApiUrl.registrasi;
    var body = {
      "nama": nama,
      "email": email,
      "password": password,
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return RegistrasiModel.fromJson(jsonObj);
  }
}
