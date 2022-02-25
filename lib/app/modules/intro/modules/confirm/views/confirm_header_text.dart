import 'package:flutter/material.dart';

import '../../../../../../utils/colors.dart';

class ConfirmHeader extends StatelessWidget {
  const ConfirmHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/correo.png'),
        const SizedBox(height: 50.0),
        Text("Verifica tu correo \n electrónico",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 20.0),
        Text(
            "Hola, verifica tu cuenta para tener acceso a encontrar tu pareja ideal",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: HexColor.fromHex('4D4D4D'))),
      ],
    );
  }
}
