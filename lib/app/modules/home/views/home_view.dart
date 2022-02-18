import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../globals/pill_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PillButton(
              child: const Text("Sign out"),
              onPressed: () => Get.find<AuthenticationController>().signOut(),
            ),
            PillButton(
              child: const Text("Test"),
              onPressed: () => Get.toNamed(Routes.register_mainInfo),
            ),
          ],
        ),
      ),
    );
  }
}
