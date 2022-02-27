import 'package:cupidum_app/app/models/navigation/page_tab_view.dart';
import 'package:cupidum_app/app/modules/tabs/modules/account/views/account_view.dart';
import 'package:cupidum_app/app/modules/tabs/modules/chat/views/chat_view.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';
import '../modules/home/views/home_view.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(
        tabs: [
          PageTabView(
            page: const HomeView(),
            icon: FontAwesome.home,
            label: "Inicio",
          ),
          PageTabView(
            page: const ChatView(),
            icon: FontAwesome.comment_o,
            label: "Chat",
          ),
          PageTabView(
            page: const AccountView(),
            icon: FontAwesome.user_circle_o,
            label: "Cuenta",
          ),
        ],
      ),
    );
  }
}
