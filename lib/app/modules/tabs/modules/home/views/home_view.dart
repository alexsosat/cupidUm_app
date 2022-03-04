import 'package:cupidum_app/app/modules/tabs/modules/home/views/widgets/home_appbar.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/views/widgets/match_swipe.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 2, child: HomeAppBar()),
          Flexible(
            flex: 11,
            child: MatchSwipableCards(),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
