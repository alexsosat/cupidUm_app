import 'package:flutter/material.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.15),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // <-- Radius
          ),
        ),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.date_range_rounded),
            ),
            Text("Fecha de nacimiento"),
          ],
        ),
      ),
    );
  }
}
