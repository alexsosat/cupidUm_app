import 'package:get/get.dart';

import '../modules/intro/views/intro_view.dart';
import '../modules/login/views/login.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String initial = Routes.intro;

  static final routes = [
    GetPage(
      name: _Paths.intro,
      page: () => IntroView(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
    ),
  ];
}
