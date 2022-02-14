part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const presentation = _Paths.presentation;
  static const intro = _Paths.intro;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const presentation = '/presentation';
  static const intro = '/intro';
  static const home = '/home';
}
