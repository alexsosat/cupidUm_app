import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../providers/user_provider.dart';
import '../../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _provider = UserProvider();

  void login() async {
    openLoadingDialog("Iniciando sesión");
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await _auth.currentUser?.reload();

      Get.find<AuthenticationController>().setUser(_auth.currentUser!);
      Get.back();
      if (_auth.currentUser!.emailVerified) {
        if (await _provider.checkIfUserExists(_auth.currentUser!.uid)) {
          Get.offAllNamed(Routes.main);
        } else {
          Get.offAllNamed(Routes.register_createUser);
        }
      } else {
        Get.to(Routes.confirm);
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
