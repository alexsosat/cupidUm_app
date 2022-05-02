import 'package:cupidum_app/app/models/navigation/page_tab_view.dart';
import 'package:cupidum_app/app/modules/tabs/controllers/user_exists_controller.dart';
import 'package:cupidum_app/app/modules/tabs/modules/account/views/account_view.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/controllers/home_controller.dart';
import 'package:cupidum_app/app/modules/tabs/modules/matches/controllers/matches_list_controller.dart';
import 'package:cupidum_app/app/modules/tabs/modules/matches/views/matches_list_view.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';
import '../modules/home/views/home_view.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserExistsController>(
      () => UserExistsController(),
    );
    Get.lazyPut<TabsController>(
      () => TabsController(
        tabs: [
          PageTabView(
            page: const HomeView(),
            icon: FontAwesome.home,
            label: "Inicio",
          ),
          // PageTabView(
          //   page: const ChatView(),
          //   icon: FontAwesome.comment_o,
          //   label: "Chat",
          // ),
          PageTabView(
            page: const MatchesList(),
            icon: FontAwesome.heart,
            label: "Matches",
          ),
          PageTabView(
            page: const AccountView(),
            icon: FontAwesome.user_circle_o,
            label: "Cuenta",
          ),
        ],
      ),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(
      () => MatchesListController(),
    );
  }
}
