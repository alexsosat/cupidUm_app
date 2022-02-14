import 'package:cupidum_app/app/modules/intro/views/widgets/intro_buttons.dart';
import 'package:cupidum_app/app/modules/intro/views/widgets/politics.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Image.asset("assets/images/logo.png")),
            const IntroButtons(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: AppPolitics(),
            ),
          ],
        ),
      ),
    );
  }
}
