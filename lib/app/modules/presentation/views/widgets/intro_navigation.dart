import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/presentation_controller.dart';
import '../../utils/button_color.dart';
import 'elevated_icon.dart';

/// The bottom navigation of the screen
class IntroNavigation extends StatelessWidget {
  const IntroNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PresentationController>(builder: (controller) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: DotsIndicator(
                  dotsCount: controller.pagesCount,
                  position: controller.currentPageIndex.value.toDouble(),
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.nextView(),
                child: ElevatedIcon(
                  icon: Icons.chevron_right,
                  iconColor: getButtonColor(controller.currentPageIndex.value),
                  size: 36,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 12,
                  padding: const EdgeInsets.all(8),
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
