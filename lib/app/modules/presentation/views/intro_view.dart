import 'package:flutter/material.dart';

import 'widgets/intro_navigation.dart';
import 'widgets/page_views.dart';

/// The Intro View
/// Contains the initial welcome screens where we greed the user with some
/// data about the politics of the app
class PresentationView extends StatelessWidget {
  const PresentationView({Key? key}) : super(key: key);

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
