import 'package:cupidum_app/globals/buttons/return_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/background.dart';
import 'widgets/foreground.dart';

class ProfileEditView extends StatelessWidget {
  ProfileEditView({Key? key}) : super(key: key);

  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            image: arguments["image"],
            name: arguments["name"],
          ),
          const Foreground(),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: ReturnButton(),
          ),
        ],
      ),
    );
  }
}
