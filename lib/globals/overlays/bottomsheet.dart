import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void openBottomSheet(Widget child) => Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
