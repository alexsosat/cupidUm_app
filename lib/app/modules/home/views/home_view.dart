import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../globals/pill_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PillButton(
          child: const Text("Sign out"),
          onPressed: () {
            Get.find<AuthenticationController>().signOut();
          },
        ),
      ),
    );
  }
}
