import 'package:flutter/material.dart';

import '../../../widgets/background_gradient_title.dart';
import '../../../widgets/foreground_section.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundGradientTitle(),
          ForeGroundSection(
            title: "REGISTRO",
            subtitle: "Registrate para continuar",
            form: Container(),
          ),
        ],
      ),
    );
  }
}
