import 'package:cupidum_app/app/modules/tabs/controllers/user_exists_controller.dart';
import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';
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
        () => Scaffold(
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: _controller.tabs.map((e) => e.page).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: _controller.tabs
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.label,
                    activeIcon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: HexColor.fromHex("F4F4F4"),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(e.icon),
                    ),
                  ),
                )
                .toList(),
            currentIndex: _controller.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Get.theme.colorScheme.primary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 28,
            elevation: 0,
            onTap: (index) => _controller.changeView(index, _tabController),
          ),
        ),
      ),
      onLoading: const Scaffold(),
      onError: (e) => Scaffold(body: _userExistsController.internetPage(e)),
    );
  }
}
