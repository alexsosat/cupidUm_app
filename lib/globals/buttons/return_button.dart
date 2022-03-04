import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () => Get.back(),
          splashColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
