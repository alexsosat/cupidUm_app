import 'package:cupidum_app/services/authentication/strapi_authentication.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}
