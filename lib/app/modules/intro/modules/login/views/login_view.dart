import 'package:cupidum_app/app/modules/intro/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/background_gradient_title.dart';
import '../../../widgets/foreground_section.dart';
import 'widgets/login_form.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_LoginFormState');
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundGradientTitle(),
          ForeGroundSection(
            title: "INICIAR SESIÓN",
            subtitle: "No tengo cuenta",
            formKey: _formKey,
            submitButtonText: "INICIAR",
            showRecoverPassword: true,
            onSubmit: () => controller.login(),
            form: LoginForm(
              formKey: _formKey,
            ),
          ),
        ],
      ),
    );
  }
}
