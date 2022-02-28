import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PillButton(
        child: const Text("CERRAR SESIÓN"),
        onPressed: () => Get.find<AuthenticationController>().signOut(),
      )),
    );
  }
}
