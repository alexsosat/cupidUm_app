import 'package:cupidum_app/app/modules/tabs/modules/home/controllers/home_controller.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                  image: MemoryImage(controller.userImage!), fit: BoxFit.cover),
            ),
          ),
          const Text("CUPIDUM"),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: const Size(50, 50),
            ),
            onPressed: () => Get.toNamed(Routes.settings),
            child: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
