import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/modules/match_done/widgets/user_photos.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchDoneView extends StatelessWidget {
  MatchDoneView({Key? key}) : super(key: key);

  final user = Get.arguments["user"] as User;
  final matchUser = Get.arguments["matchUser"] as User;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 170,
              child: UserPhotos(
                user: user,
                matchUser: matchUser,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Hiciste un nuevo match con ${matchUser.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 60),
            PillButton(
              child: const Text("YAY!"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
