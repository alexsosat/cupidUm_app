import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/intro/modules/login/views/login.dart';
import '../modules/presentation/bindings/presentation_binding.dart';
import '../modules/presentation/views/intro_view.dart';

part 'app_routes.dart';

/// The Pages for the app
class AppPages {
  AppPages._();

  static String initial = Routes.presentation;

  static final routes = [
    GetPage(
      name: _Paths.presentation,
      page: () => const PresentationView(),
      binding: PresentationBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
    ),
  ];
}
