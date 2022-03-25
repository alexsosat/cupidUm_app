import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/globals/buttons/return_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/background.dart';
import 'widgets/foreground.dart';

class ProfileEditView extends StatelessWidget {
  ProfileEditView({Key? key}) : super(key: key);

  final user = Get.arguments["user"] as User;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            image: user.image,
            name: user.name,
          ),
          Foreground(user: user),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: ReturnButton(),
          ),
        ],
      ),
    );
  }
}
