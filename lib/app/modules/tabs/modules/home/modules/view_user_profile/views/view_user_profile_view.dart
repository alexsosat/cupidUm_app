import 'dart:convert';

import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/modules/tabs/modules/account/views/widgets/user_info.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewUserProfileView extends StatelessWidget {
  ViewUserProfileView({Key? key}) : super(key: key);

  final User user = Get.arguments as User;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Image.memory(
              base64Decode(user.image),
              fit: BoxFit.cover,
            ),
          ),
          UserInfo(
            isFullScreen: true,
            name: user.fullName,
            edad: user.age,
            descripcion: user.description,
            peso: user.weight,
            celular: user.phone,
            school: user.school,
            hobbies: user.hobbies,
          ),
          Positioned(
            top: kToolbarHeight,
            left: 25,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.3),
                primary: Colors.white,
                side: const BorderSide(width: 2.0, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(0),
                fixedSize: const Size(50, 60),
              ),
              onPressed: () => Get.back(),
              child: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
