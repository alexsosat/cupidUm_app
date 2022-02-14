part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const presentation = _Paths.presentation;
  static const login = _Paths.login;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const presentation = '/presentation';
  static const login = '/login';
  static const home = '/home';
}
