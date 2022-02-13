import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  Rx<int> currentPageIndex = Rx<int>(0);
  int pagesCount = 3;
  final PageController pageController = PageController();

  void nextView() {
    if (pageController.page == pagesCount - 1) {
      Get.toNamed(Routes.login);
    }
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}
