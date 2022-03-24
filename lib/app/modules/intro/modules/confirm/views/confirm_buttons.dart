import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../globals/buttons/pill_button.dart';

class ConfirmButtons extends StatelessWidget {
  const ConfirmButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PillButton(
          child: const Text("REENVIAR VERIFICACIÓN"),
          onPressed: () =>
              Get.find<AuthenticationController>().sendVerification(),
        ),
        const SizedBox(height: 10.0),
        PillButton(
          child: const Text("REGRESAR"),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
