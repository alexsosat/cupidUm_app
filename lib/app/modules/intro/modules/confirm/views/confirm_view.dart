import 'package:cupidum_app/app/modules/intro/modules/confirm/views/confirm_buttons.dart';
import 'package:cupidum_app/app/modules/intro/modules/confirm/views/confirm_header_text.dart';
import 'package:flutter/material.dart';

class ConfirmView extends StatelessWidget {
  const ConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          ConfirmHeader(),
          ConfirmButtons(),
        ],
      ),
    ));
  }
}
