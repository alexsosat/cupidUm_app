import 'package:cupidum_app/app/models/navigation/page_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  final List<PageTabView> tabs;

  TabsController({required this.tabs});

  var selectedIndex = 0.obs;

  /// * Mehod that changes to the selected page in the bottomNavigation
  changeView(int selectIndex, TabController tabController) {
    tabController.animateTo(selectIndex);

    selectedIndex(selectIndex);
  }
}
