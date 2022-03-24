import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/controllers/settings_controller.dart';
import 'package:cupidum_app/globals/buttons/return_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/background.dart';
import 'widgets/foreground.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (user) => Stack(
          children: [
            const Background(),
            Foreground(
              name: user!.name,
              image: user.image,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: ReturnButton(),
            ),
          ],
        ),
        onError: (error) => controller.internetPage(error),
      ),
    );
  }
}
