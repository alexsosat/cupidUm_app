import 'package:cupidum_app/app/models/navigation/page_tab_view.dart';
import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  final List<PageTabView> tabs;

  TabsController({required this.tabs});

  var selectedIndex = 0.obs;

  List<Widget> mainTabs = [];
  // one buildContext for each tab to store history  of navigation
  late List<BuildContext?> navStack;
  List<BottomNavigationBarItem> bottomNavigationBarRootItems = [];

  @override
  void onInit() {
    navStack = []..length = tabs.length;
    for (int i = 0; i < tabs.length; i++) {
      //navigationKeys.add(GlobalKey());
      mainTabs.add(
        Navigator(
            key: Get.nestedKey(i),
            onGenerateRoute: (RouteSettings settings) {
              return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
                navStack[i] = context;
                return tabs[i].page;
              });
            }),
      );
      bottomNavigationBarRootItems.add(
        BottomNavigationBarItem(
          icon: Icon(tabs[i].icon),
          label: tabs[i].label,
          activeIcon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: HexColor.fromHex("F4F4F4"),
              shape: BoxShape.circle,
            ),
            child: Icon(tabs[i].icon),
          ),
        ),
      );
    }
    super.onInit();
  }

  /// * Mehod that changes to the selected page in the bottomNavigation
  changeStatus(int selectIndex, TabController tabController) {
    tabController.animateTo(selectIndex);

    selectedIndex(selectIndex);
  }

  /// * Mehod that evaluates the status of the page and realize an action based on
  /// * a set of condition
  void onItemTapped(int index, TabController tabController) {
    /// return to the main page if the users selects the selectedPage and is in a
    /// subpage of that page
    if (index == selectedIndex.value) {
      final NavigatorState navState =
          Navigator.of(navStack[tabController.index]!);
      if (navState.canPop()) {
        do {
          navState.pop();
        } while (navState.canPop());
      }
    }

    changeStatus(index, tabController);
  }

  /// * Mehod used to navigate to a subpage inside a tab Page
  void goToSubTabView(Widget widget, BuildContext context) {
    Get.to(
      () => widget,
      id: selectedIndex.value,
    );
  }
}
