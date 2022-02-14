import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/email_login_input.dart';
import '../../../../widgets/password_login_input.dart';
import '../../controllers/login_controller.dart';

class LoginForm extends GetView<LoginController> {
  final GlobalKey<FormState> formKey;

  const LoginForm({
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
        ],
      ),
    );
  }
}
