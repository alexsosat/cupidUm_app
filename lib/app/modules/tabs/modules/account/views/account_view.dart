import 'dart:convert';

import 'package:cupidum_app/app/modules/tabs/modules/account/views/widgets/user_info.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends GetView<HomeController> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (e) => Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Image.memory(
                base64Decode(controller.user!.image),
                fit: BoxFit.cover,
              ),
            ),
            UserInfo(
              name: controller.user!.fullName,
              edad: controller.user!.age,
              descripcion: controller.user!.description,
              peso: controller.user!.weight,
              celular: controller.user!.phone,
              school: controller.user!.school!,
              hobbies: controller.user!.hobbies,
            ),
          ],
        ),
        onError: (error) => controller.internetPage(error),
      ),
    );
  }
}
