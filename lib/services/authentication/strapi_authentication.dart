import 'dart:async';
import 'dart:convert';

import 'package:cupidum_app/environment/strapi_keys.dart';
import 'package:cupidum_app/services/authentication/jwt_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

class Strapi {
  static GetStorage getStorage = GetStorage('StrapiKeys');
  final _http = UMMobileCustomHttp(baseUrl: "${getWebUrl()}/auth/local");

  static String? get jwtKey => getStorage.read('jwtKey');

  Future strapiLogin() async {
    try {
      final jwtModel = await _http.customPost<JwtModel>(
        path: "",
        body: jsonEncode(strapiCredentials),
        mapper: (json) => JwtModel.fromMap(json),
      );

      await getStorage.write('jwtKey', jwtModel.jwt);
    } catch (e) {
      if (kDebugMode) {
        print(
            "Something bad happened when getting the jwt key ${e.toString()}");
      }
    }
  }
}
