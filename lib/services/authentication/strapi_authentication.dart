import 'dart:async';
import 'dart:convert';

import 'package:cupidum_app/environment/strapi_keys.dart';
import 'package:cupidum_app/services/authentication/jwt_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

class Strapi {
  static late SharedPreferences _storage;
  final _http = UMMobileCustomHttp(baseUrl: "${getWebUrl()}/auth/local");

  static String? get jwtKey => _storage.getString('jwtKey');

  static initConfiguration() async {
    _storage = await SharedPreferences.getInstance();
  }

  Future strapiLogin() async {
    try {
      final jwtModel = await _http.customPost<JwtModel>(
        path: "",
        body: jsonEncode(strapiCredentials),
        mapper: (json) => JwtModel.fromMap(json),
      );

      await _storage.setString('jwtKey', jwtModel.jwt);
    } catch (e) {
      if (kDebugMode) {
        print(
            "Something bad happened when getting the jwt key ${e.toString()}");
      }
    }
  }
}
