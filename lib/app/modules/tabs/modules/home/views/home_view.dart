import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 2, child: Container(color: Colors.pink)),
          Flexible(
            flex: 8,
            child: SwipableStack(
              builder: (context, properties) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/placeholder.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              overlayBuilder: (context, properties) {
                final opacity = min(properties.swipeProgress, 1.0);
                final isRight = properties.direction == SwipeDirection.right;
                return Opacity(
                  opacity: isRight ? opacity : 0,
                  child: const Center(
                    child: Icon(
                      Icons.signal_cellular_no_sim_sharp,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
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
