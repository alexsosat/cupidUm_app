import 'package:cupidum_app/app/modules/intro/bindings/intro_binding.dart';
import 'package:get/get.dart';

import '../modules/intro/views/intro_view.dart';
import '../modules/login/views/login.dart';

part 'app_routes.dart';

/// The Pages for the app
class AppPages {
  AppPages._();

  static String initial = Routes.intro;

  static final routes = [
    GetPage(
      name: _Paths.intro,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
    ),
  ];
}
