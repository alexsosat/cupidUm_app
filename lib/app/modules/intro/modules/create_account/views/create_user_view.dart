import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/pages/main_info_view.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/pages/objective_info_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserView extends GetView<CreateUserController> {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MainInfoView(),
          const ObjectiveInfoView(),
        ],
      ),
    );
  }
}
