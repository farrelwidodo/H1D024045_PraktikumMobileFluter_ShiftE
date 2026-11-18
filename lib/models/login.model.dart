class LoginModel {
  int? code;
  bool? status;
  LoginData? data;

  LoginModel({this.code, this.status, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      code: json['code'],
      status: json['status'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  String? token;
  UserData? user;

  LoginData({this.token, this.user});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'],
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }
}

class UserData {
  String? id;
  String? email;

  UserData({this.id, this.email});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id']?.toString(),
      email: json['email']?.toString(),
    );
  }
}

