import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// An elevated button with a pill form
class PillButton extends StatelessWidget {
  /// The content inside the button
  final Widget child;

  /// The buttons background color
  final Color? color;

  /// The method executed when the button is pressed
  final Function() onPressed;

  const PillButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 55),
          shape: const StadiumBorder(),
          primary: color,
          onPrimary: Colors.white,
          elevation: 5,
          textStyle: GoogleFonts.mulish(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
