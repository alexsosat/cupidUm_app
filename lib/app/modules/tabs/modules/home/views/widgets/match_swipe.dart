import 'dart:convert';
import 'dart:math';

import 'package:cupidum_app/app/modules/tabs/modules/home/controllers/home_controller.dart';
import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

class MatchSwipableCards extends GetView<HomeController> {
  const MatchSwipableCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwipableStack(
      controller: controller.actionButton,
      allowVerticalSwipe: false,
      itemCount: controller.userList.length,
      builder: (context, properties) {
        return Container(
          margin: const EdgeInsets.all(30.0),
          height: double.infinity,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: MemoryImage(
                  base64Decode(controller.userList[properties.index].image)),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment(0, -1.3),
              ),
            ),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.userList[properties.index].fullName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.userList[properties.index].description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        );
      },
      overlayBuilder: (context, properties) {
        final opacity = min(properties.swipeProgress, 1.0);

        return Opacity(
          opacity: opacity,
          child: Container(
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: HexColor.fromHex("E94057").withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: _getCenterIcon(properties.direction),
            ),
          ),
        );
      },
      onSwipeCompleted: (index, direction) {
        switch (direction) {
          case SwipeDirection.right:
            controller.matchSwipeCardAction(index);
            break;
          case SwipeDirection.left:
            break;
          default:
        }
      },
    );
  }

  Widget? _getCenterIcon(SwipeDirection direction) {
    switch (direction) {
      case SwipeDirection.right:
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 50,
                color: Colors.black.withOpacity(0.07),
              ),
            ],
          ),
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        );

      case SwipeDirection.left:
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 50,
                color: Colors.black.withOpacity(0.07),
              ),
            ],
          ),
          child: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );

      default:
        return null;
    }
  }
}
