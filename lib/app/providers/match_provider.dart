import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/environment/strapi_keys.dart';
import 'package:cupidum_app/services/authentication/strapi_authentication.dart';
import 'package:get/get.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

import '../modules/intro/controllers/authentication_controller.dart';

class MatchProvider {
  /// The path of the requests group.
  static const String path = '/matches';

  String? userUID = Get.find<AuthenticationController>().userUID;

  /// The API client.
  final UMMobileCustomHttp _http = UMMobileCustomHttp(
    baseUrl: getWebUrl() + path,
  );

  /// Retrieves the user matches
  Future<List<User>> getUserMatches() => _http.customGet<List<User>>(
        path: "/$userUID",
        mapper: (json) =>
            List<User>.from(json.map((model) => User.fromJson(model))),
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
      );

  Future addMatch(User user, {String? uid}) => _http.customPut(
        path: "/add/" + (uid ?? userUID)!,
        headers: {
          "Authorization": "Bearer ${Strapi.jwtKey}",
        },
        body: User.userToJson(user),
      );
}
