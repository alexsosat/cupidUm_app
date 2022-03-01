import 'package:cupidum_app/app/modules/tabs/controllers/user_exists_controller.dart';
import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends StatefulWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _controller = Get.find<TabsController>();
  final _userExistsController = Get.find<UserExistsController>();

  @override
  void initState() {
    _tabController =
        TabController(length: _controller.tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _userExistsController.obx(
      (state) => Obx(
        () => WillPopScope(
          child: Scaffold(
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: _controller.mainTabs,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: _controller.bottomNavigationBarRootItems,
              currentIndex: _controller.selectedIndex.value,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Get.theme.colorScheme.primary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 28,
              elevation: 0,
              onTap: (index) => _controller.onItemTapped(index, _tabController),
            ),
          ),
          onWillPop: () async {
            final NavigatorState navState = Navigator.of(
                _controller.navStack[_controller.selectedIndex.value]!);
            if (navState.canPop()) {
              navState.pop();
              return false;
            } else {
              if (_controller.selectedIndex.value == 0) {
                _controller.changeStatus(0, _tabController);
                openDialogWindow(
                  title: "Advertencia",
                  message: "Deseas abandonar la aplicación",
                  onCancel: () => Get.back(),
                  onConfirm: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
                ); // close the app // close the app
                return true;
              } else {
                _controller.onItemTapped(0, _tabController);
                return false;
              }
            }
          },
        ),
      ),
      onLoading: const Scaffold(),
      onError: (e) => Scaffold(
        body: Center(
          child: Text(e!),
        ),
      ),
    );
  }
}
