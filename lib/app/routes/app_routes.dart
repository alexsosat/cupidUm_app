// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const presentation = _Paths.presentation;
  static const intro = _Paths.intro;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const confirm = _Paths.confirm;
  static const register_mainInfo = _Paths.register_mainInfo;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const presentation = '/presentation';
  static const intro = '/intro';
  static const login = '/login';
  static const register = '/register';
  static const confirm = '/confirm-user';
  static const register_mainInfo = '/register/main-info';
  static const home = '/home';
}
