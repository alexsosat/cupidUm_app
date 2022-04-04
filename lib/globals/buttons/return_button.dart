import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.back(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(0),
        fixedSize: const Size(50, 60),
        primary: Colors.white,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 8,
      ),
      child: Icon(
        Icons.chevron_left,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
