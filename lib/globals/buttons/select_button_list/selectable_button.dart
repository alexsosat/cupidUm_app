import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  final bool isActive;
  final Function() onPressed;
  const SelectableButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.isActive = false,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Align(
        alignment: alignment,
        child: child,
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: const Size(50, 50),
        primary: isActive ? Colors.white : null,
        backgroundColor:
            isActive ? Theme.of(context).colorScheme.primary : null,
      ),
    );
  }
}
