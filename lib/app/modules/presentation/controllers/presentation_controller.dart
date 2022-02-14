import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentationController extends GetxController {
  /// The intro view the user is in
  Rx<int> currentPageIndex = Rx<int>(0);

  /// The amount of intro pages the app has
  int pagesCount = 3;

  /// The controller for the page view
  final PageController pageController = PageController();

  /// Moves the page view to the next page.
  /// In case is the final view sends the user to the login screen
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
