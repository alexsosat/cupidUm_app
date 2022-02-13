import 'package:cupidum_app/app/modules/intro/views/widgets/intro_navigation.dart';
import 'package:cupidum_app/app/modules/intro/views/widgets/page_views.dart';
import 'package:flutter/material.dart';

/// The Intro View
/// Contains the initial welcome screens where we greed the user with some
/// data about the politics of the app
class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          PageViews(),
          IntroNavigation(),
        ],
      ),
    );
  }
}
