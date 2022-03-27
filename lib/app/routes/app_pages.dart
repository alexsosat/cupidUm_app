import 'package:cupidum_app/app/modules/intro/modules/create_account/views/create_user_view.dart';
import 'package:cupidum_app/app/modules/match_done/match_done_view.dart';
import 'package:cupidum_app/app/modules/tabs/bindings/navigation_bindings.dart';
import 'package:cupidum_app/app/modules/tabs/modules/chat/modules/chat_room/views/chat_room_view.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/bindings/profile_edit_binddings.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/modules/about_me/about_me_edit.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/modules/about_me/bindings/about_me_edit_bindings.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/modules/interests/bindings/interests_edit_bindings.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/modules/interests/interests_edit_view.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/modules/personal_data/personal_data_edit.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/modules/profile_edit/views/profile_edit_view.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/views/settings_view.dart';
import 'package:cupidum_app/app/modules/tabs/views/tabs_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/intro/middlewares/is_user_logged_in.dart';
import '../modules/intro/modules/confirm/views/confirm_view.dart';
import '../modules/intro/modules/create_account/bindings/create_user_bindings.dart';

import '../modules/intro/modules/login/bindings/login_binding.dart';
import '../modules/intro/modules/login/views/login_view.dart';
import '../modules/intro/modules/register/bindings/register_bindings.dart';
import '../modules/intro/modules/register/views/register_view.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/presentation/bindings/presentation_binding.dart';
import '../modules/presentation/views/presentation_view.dart';
import '../modules/tabs/modules/home/modules/settings/bindings/settings_bindings.dart';

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
      page: () => const ConfirmView(),
    ),
    GetPage(
      name: _Paths.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.main,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.chat,
      page: () => const ChatRoomView(),
    ),
    GetPage(
      name: _Paths.register_createUser,
      page: () => const CreateUserView(),
      binding: CreateUserBinding(),
    ),
    GetPage(
      name: _Paths.profile_edit,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.personal_data_edit,
      page: () => PersonalDataEditView(),
    ),
    GetPage(
      name: _Paths.interests_data_edit,
      page: () => const InterestsInfoEditView(),
      binding: InterestsEditBinding(),
    ),
    GetPage(
      name: _Paths.profile_edit,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.match_done,
      page: () => MatchDoneView(),
    ),
    GetPage(
      name: _Paths.about_data_edit,
      page: () => AboutInfoEdit(),
      binding: AboutEditBinding(),
    ),
  ];
}
