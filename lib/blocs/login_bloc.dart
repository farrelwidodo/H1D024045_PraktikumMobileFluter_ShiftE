import '../helpers/api.dart';
import '../helpers/api_url.dart';
import '../models/login.model.dart';

class LoginBloc {
  static Future<LoginModel> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};

    var response = await Api().post(apiUrl, body);

    // Karena Api().post() mengembalikan Map/dynamic, kita bisa langsung mapping ke Model
    var jsonObj = response;
    return LoginModel.fromJson(jsonObj);
  }
}

