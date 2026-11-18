import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Api {
  Future<dynamic> post(dynamic url, dynamic data) async {
    var token = ''; // Nanti bisa diisi token login jika diperlukan
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Tidak ada koneksi Internet');
    }
    return responseJson;
  }

  Future<dynamic> get(dynamic url) async {
    var token = '';
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Tidak ada koneksi Internet');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Terjadi kesalahan saat berkomunikasi dengan server dengan StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Kesalahan Komunikasi: ");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Permintaan Tidak Valid: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "Tidak Diizinkan: ");
}

