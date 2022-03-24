import 'package:cupidum_app/app/models/user/school.dart';
import 'package:cupidum_app/environment/strapi_keys.dart';
import 'package:cupidum_app/services/authentication/strapi_authentication.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

class SchoolProvider {
  /// The path of the requests group.
  static const String path = '/facultades';

  /// The API client.
  final UMMobileCustomHttp _http = UMMobileCustomHttp(
    baseUrl: getWebUrl() + path,
  );

  /// Retrieves whether the user exists on the api
  Future<List<School>> getSchools() {
    return _http.customGet<List<School>>(
      path: "",
      mapper: (json) =>
          List<School>.from((json).map((x) => School.fromJson(x))),
      headers: {
        "Authorization": "Bearer ${Strapi.jwtKey}",
      },
    );
  }
}
