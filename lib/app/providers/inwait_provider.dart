import 'dart:convert';

import 'package:cupidum_app/app/models/user/short_user.dart';
import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/environment/strapi_keys.dart';
import 'package:cupidum_app/services/authentication/strapi_authentication.dart';
import 'package:get/get.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

class InWaitProvider {
  /// The path of the requests group.
  static const String path = '/esperas';

  String? userUID = Get.find<AuthenticationController>().userUID;

  /// The API client.
  final UMMobileCustomHttp _http = UMMobileCustomHttp(
    baseUrl: getWebUrl() + path,
  );

  /// Retrieves the user match requests
  Future<List<ShortUser>> getUsersInWait({String? uid}) =>
      _http.customGet<List<ShortUser>>(
        path: "/" + (uid ?? userUID)!,
        mapper: (json) =>
            List<ShortUser>.from(json.map((model) => ShortUser.fromMap(model))),
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
      );

  Future editInWaitList(List<ShortUser> users, {String? uid}) =>
      _http.customPut(
        path: "/editList/" + (uid ?? userUID)!,
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
        body: jsonEncode(users),
      );

  Future addInWait(User user, {String? uid}) => _http.customPut(
        path: "/add/" + (uid ?? userUID)!,
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
        body: User.userToJson(user),
      );
}
