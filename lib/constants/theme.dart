import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// The light mode theme of the app
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: HexColor.fromHex("FD397F"),
    secondary: HexColor.fromHex("481380"),
  ),
  hintColor: Colors.grey,
  backgroundColor: Colors.white,

  // Define the default font family.
  textTheme: GoogleFonts.mulishTextTheme(
    Get.textTheme.copyWith(
      headline1: Get.textTheme.headline1!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
      headline2: Get.textTheme.headline2!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      headline3: Get.textTheme.headline3!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontSize: 24,
      ),
      button: Get.textTheme.button!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
);

/// The dark mode theme of the app
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: HexColor.fromHex("FD397F"),
    secondary: HexColor.fromHex("481380"),
  ),
  backgroundColor: HexColor.fromHex("312B35"),

  // Define the default font family.
  textTheme: GoogleFonts.mulishTextTheme(
    Get.textTheme.copyWith(
      headline1: Get.textTheme.headline1!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
      headline2: Get.textTheme.headline2!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      headline3: Get.textTheme.headline3!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontSize: 24,
      ),
      button: Get.textTheme.button!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
);
