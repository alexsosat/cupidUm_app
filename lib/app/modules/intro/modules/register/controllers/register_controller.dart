import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    try {
        await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = FirebaseAuth.instance.currentUser;


      await user?.sendEmailVerification();

      Get.offAndToNamed(Routes.confirm);
    } catch (e) {
      Get.snackbar(
        "Error al crear cuenta",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
