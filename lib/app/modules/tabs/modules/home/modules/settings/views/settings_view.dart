import 'package:flutter/material.dart';

import 'widgets/background.dart';
import 'widgets/foreground.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: const [
        Background(),
        Foreground(),
      ],
    ));
  }
}
