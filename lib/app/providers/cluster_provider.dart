import 'package:cupidum_app/app/models/user/cluster_form.dart';
import 'package:ummobile_custom_http/ummobile_custom_http.dart';

class ClusterProvider {
  /// The API client.
  final UMMobileCustomHttp _http =
      UMMobileCustomHttp(baseUrl: 'http://h4mst3r.pythonanywhere.com');

  /// Retrieves the cluster that the user belongs to
  Future<int> getCluster(ClusterForm cf) {
    return _http.customPost<int>(
      path: "",
      mapper: (json) => int.parse(json),
      body: cf.toJson(),
    );
  }
}
