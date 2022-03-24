import 'package:cupidum_app/app/modules/intro/widgets/password_login_input.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/controllers/settings_controller.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

changePassword() {
  Get.dialog(AlertDialog(
    title: Text("Cambiar contraseña"),
    content: SizedBox(
        height: 240,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PasswordLoginInput(
                  controller:
                      Get.find<SettingsController>().oriPasswordController),
              PasswordLoginInput(
                  controller:
                      Get.find<SettingsController>().newPasswordController),
              PillButton(
                  child: Text("Cambiar contraseña"),
                  onPressed: () =>
                      Get.find<SettingsController>().changePasswordFirebase()),
            ])),
  ));
}
