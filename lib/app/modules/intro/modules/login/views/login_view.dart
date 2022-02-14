import 'package:flutter/material.dart';

import '../../../widgets/background_gradient_title.dart';
import '../../../widgets/foreground_section.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
            form: LoginForm(),
          ),
        ],
      ),
    );
  }
}
