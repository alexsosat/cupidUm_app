import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserAppBar extends StatelessWidget {
  final Function() onNext;
  final bool showLeading;

  const CreateUserAppBar({
    Key? key,
    required this.onNext,
    this.showLeading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 50,
      color: Colors.transparent,
      child: Row(
        children: [
          const SizedBox(width: 25),
          if (showLeading)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(50, 50),
              ),
              onPressed: () => Get.find<CreateUserController>().previousPage(),
              child: const Icon(Icons.chevron_left),
            ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text("Siguiente"),
              onPressed: onNext,
            ),
          )
        ],
      ),
    );
  }
}
