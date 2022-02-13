import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';

Color getButtonColor(int position) {
  switch (position) {
    case 0:
      return HexColor.fromHex("673689");
    case 1:
      return HexColor.fromHex("EE4888");
    case 2:
      return HexColor.fromHex("903666");
    default:
      return Colors.pink;
  }
}
