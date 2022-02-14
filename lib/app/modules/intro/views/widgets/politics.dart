import 'package:flutter/material.dart';

class AppPolitics extends StatelessWidget {
  const AppPolitics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textTheme.button!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Terms of use",
            style: buttonTextStyle,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.button!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
          ),
        ),
      ],
    );
  }
}
