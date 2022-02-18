import 'package:flutter/material.dart';

class ConfirmView extends StatelessWidget {
  const ConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text('Confirm your email',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            )));
  }
}
