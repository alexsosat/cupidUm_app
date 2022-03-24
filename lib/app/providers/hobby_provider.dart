import 'package:cupidum_app/app/models/user/hobby.dart';
import 'package:cupidum_app/environment/strapi_keys.dart';
import 'package:cupidum_app/services/authentication/strapi_authentication.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

class HobbyProvider {
  /// The path of the requests group.
  static const String path = '/hobbies';

  /// The API client.
  final UMMobileCustomHttp _http = UMMobileCustomHttp(
    baseUrl: getWebUrl() + path,
  );

  /// Retrieves whether the user exists on the api
  Future<List<Hobby>> getHobbies() {
    return _http.customGet<List<Hobby>>(
      path: "",
      mapper: (json) => List<Hobby>.from((json).map((x) => Hobby.fromJson(x))),
      headers: {
        "Authorization": "Bearer ${Strapi.jwtKey}",
      },
    );
  }
}
