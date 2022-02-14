import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/background_gradient_title.dart';
import '../../../widgets/foreground_section.dart';
import '../controllers/register_controller.dart';
import 'widgets/register_form.dart';

class RegisterView extends GetView<RegisterController> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundGradientTitle(),
          ForeGroundSection(
            formKey: _formKey,
            title: "REGISTRO",
            subtitle: "Registrate para continuar",
            submitButtonText: "FINALIZAR",
            onSubmit: () => controller.register(),
            form: RegisterForm(
              formKey: _formKey,
            ),
          ),
        ],
      ),
    );
  }
}
