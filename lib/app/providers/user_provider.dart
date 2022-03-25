import 'dart:convert';

import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/environment/strapi_keys.dart';
import 'package:cupidum_app/services/authentication/strapi_authentication.dart';
import 'package:get/get.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

class UserProvider {
  /// The path of the requests group.
  static const String path = '/cuentas';

  String? userUID = Get.find<AuthenticationController>().userUID;

  /// The API client.
  final UMMobileCustomHttp _http = UMMobileCustomHttp(
    baseUrl: getWebUrl() + path,
  );

  Future<bool> createUser(User user) => _http.customPost<bool>(
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
        mapper: (json) => true,
      );

  /// Retrieves the user information
  Future<User> getUser() => _http.customGet<User>(
        path: "/$userUID",
        mapper: (json) => User.fromJson(json),
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
      );

  Future<bool> checkIfUserExists([String? uid]) {
    String? id = uid ?? userUID;
    return _http.customGet<bool>(
      path: "/exist/$id",
      mapper: (response) => response as bool,
      headers: {
        "Authorization": "Bearer ${Strapi.jwtKey}",
      },
    );
  }

  Future<List<User>> getUserList() => _http.customGet<List<User>>(
        path: "",
        mapper: (response) {
          return List<User>.from(response.map((model) => User.fromJson(model)));
        },
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
      );

  Future updateUser(Map<String, dynamic> keys) => _http.customPut(
        path: "/$userUID",
        body: jsonEncode(keys),
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
      );
}
