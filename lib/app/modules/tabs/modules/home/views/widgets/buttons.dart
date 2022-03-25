import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../controllers/home_controller.dart';

class Buttonswidget extends GetView<HomeController> {
  const Buttonswidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            controller.actionButton.next(swipeDirection: SwipeDirection.left);
          },
          child: const Icon(
            Icons.close_rounded,
            color: Colors.red,
            size: 40,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.white,
            onPrimary: Colors.red,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(25),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.actionButton.next(swipeDirection: SwipeDirection.right);
          },
          child: const Icon(
            Icons.favorite,
            size: 50,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shadowColor: Theme.of(context).colorScheme.primary,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(30),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Icons.assignment_ind,
            color: Colors.purple,
            size: 40,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.white,
            onPrimary: Colors.purple,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(25),
          ),
        ),
      ],
    );
  }
}
