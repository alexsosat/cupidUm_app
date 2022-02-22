import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class IntroButtons extends StatelessWidget {
  const IntroButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PillButton(
          child: const Text("INICIAR SESIÓN"),
          onPressed: () => Get.toNamed(Routes.login),
        ),
        PillButton(
          child: const Text("REGISTRATE"),
          onPressed: () => Get.toNamed(Routes.register),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
