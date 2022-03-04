import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          PillButton(
            child: const Text("CERRAR SESIÓN"),
            onPressed: () => Get.find<AuthenticationController>().signOut(),
          ),
          PillButton(
              child: Text("Ajustes"),
              onPressed: () => Get.toNamed(Routes.settings))
        ],
      )),
    );
  }
}
