import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: Size(50, 50),
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
