import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class IsUserLoggedIn extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool authenticated = Get.find<AuthenticationController>().isUserLoggedIn;
    return authenticated ? const RouteSettings(name: Routes.home) : null;
  }
}
