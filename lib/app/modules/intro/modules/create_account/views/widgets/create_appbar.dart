import 'package:flutter/material.dart';

class CreateUserAppBar extends StatelessWidget {
  const CreateUserAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Text("Siguiente"),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
