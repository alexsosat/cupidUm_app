import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../modules/home/views/home_view.dart';
import '../modules/intro/middlewares/is_user_logged_in.dart';
import '../modules/intro/modules/confirm/views/confirm_view.dart';
import '../modules/intro/modules/login/bindings/login_binding.dart';
import '../modules/intro/modules/login/views/login_view.dart';
import '../modules/intro/modules/register/bindings/register_bindings.dart';
import '../modules/intro/modules/register/views/register_view.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/presentation/bindings/presentation_binding.dart';
import '../modules/presentation/views/presentation_view.dart';

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
      name: _Paths.intro,
      page: () => const IntroView(),
      middlewares: [IsUserLoggedIn()],
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.confirm,
      page: () => ConfirmView(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.register_mainInfo,
      page: () => MainInfoView(),
      binding: CreateUserBinding(),
    ),
  ];
}
