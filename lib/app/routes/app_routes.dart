// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const presentation = _Paths.presentation;
  static const intro = _Paths.intro;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const confirm = _Paths.confirm;
  static const settings = _Paths.settings;
  static const register_createUser = _Paths.register_createUser;
  static const main = _Paths.main;
  static const profile_edit = _Paths.profile_edit;
  static const personal_data_edit = _Paths.personal_data_edit;
  static const about_data_edit = _Paths.about_data_edit;
  static const aditional_data_edit = _Paths.aditional_data_edit;
  static const interests_data_edit = _Paths.interests_data_edit;
  static String chat(String uid) => '/chat/$uid';
}

abstract class _Paths {
  static const presentation = '/presentation';
  static const intro = '/intro';
  static const login = '/login';
  static const register = '/register';
  static const confirm = '/confirm-user';
  static const settings = '/settings';
  static const register_createUser = '/register/create-user';
  static const profile_edit = '/profile-edit';
  static const personal_data_edit = '/personal-data/edit';
  static const about_data_edit = '/about-data/edit';
  static const aditional_data_edit = '/aditional_data/edit';
  static const interests_data_edit = '/interests_data/edit';
  static const main = '/';
  static const chat = '/chat/:uid';
}
