import 'package:cupidum_app/app/modules/intro/modules/register/views/widgets/register_form.dart';
import 'package:flutter/material.dart';

import '../../../widgets/background_gradient_title.dart';
import '../../../widgets/foreground_section.dart';

class RegisterView extends StatelessWidget {
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
            form: RegisterForm(
              formKey: _formKey,
            ),
          ),
        ],
      ),
    );
  }
}
