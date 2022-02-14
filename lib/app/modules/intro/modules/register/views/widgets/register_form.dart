import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/email_login_input.dart';
import '../../../../widgets/password_login_input.dart';
import '../../controllers/register_controller.dart';
import 'confirm_password_input.dart';

class RegisterForm extends GetView<RegisterController> {
  final GlobalKey<FormState> formKey;

  const RegisterForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailLoginInput(controller: controller.emailController),
          PasswordLoginInput(controller: controller.passwordController),
          ConfirmPasswordInput(
            confirmController: controller.confirmPasswordController,
            passwordController: controller.passwordController,
          ),
        ],
      ),
    );
  }
}
