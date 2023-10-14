import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:kncha_app/feautures/login/domain/model/login_model.dart';

class AuthServices {
  static Future<bool> login(String user, String password) async {
    bool result = false;
    final getJson = await rootBundle.loadString('assets/login.json');
    final jsonResponse = json.decode(getJson);
    final data = LoginModel.fromJson(jsonResponse).results;
    data?.forEach(
      (element) {
        if (element.user == user && element.password == password) {
          result = true;
        }
      },
    );
    return result;
  }
}
