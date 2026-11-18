import '../helpers/api.dart';
import '../helpers/api_url.dart';
import '../models/registrasi.model.dart';

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
    return RegistrasiModel.fromJson(response);
  }
}

