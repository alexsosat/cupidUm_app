import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: HexColor.fromHex("FD397F"),
    secondary: HexColor.fromHex("481380"),
  ),
  hintColor: Colors.grey,

  // Define the default font family.
  textTheme: GoogleFonts.mulishTextTheme(
    Get.textTheme.copyWith(
      headline1: Get.textTheme.headline1!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
);
