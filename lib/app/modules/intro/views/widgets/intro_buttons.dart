import 'package:cupidum_app/globals/pill_button.dart';
import 'package:flutter/material.dart';

class IntroButtons extends StatelessWidget {
  const IntroButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PillButton(
          child: const Text("INICIAR SESIÓN"),
          onPressed: () => print("Inicio"),
        ),
        PillButton(
          child: const Text("REGISTRATE"),
          onPressed: () => print("Registrate"),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
