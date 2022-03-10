import 'package:cupidum_app/app/modules/tabs/modules/home/controllers/home_controller.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/views/widgets/home_appbar.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/views/widgets/match_swipe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Column(
          children: [
            const Flexible(flex: 2, child: HomeAppBar()),
            const Flexible(
              flex: 11,
              child: MatchSwipableCards(),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.grey,
              ),
            )
          ],
        ),
        onError: (error) => controller.internetPage(error),
      ),
    );
  }
}
