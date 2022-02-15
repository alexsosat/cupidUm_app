part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const presentation = _Paths.presentation;
  static const intro = _Paths.intro;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const home = _Paths.home;
  static const confirm = _Paths.confirm;
}

abstract class _Paths {
  static const presentation = '/presentation';
  static const intro = '/intro';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const confirm = '/confirm-user';
}
