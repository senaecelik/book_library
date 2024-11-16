import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._init();
  static ColorManager get instance => _instance;
  ColorManager._init();

  final Color white = HexColor.fromHex("#FFFFFF");
  final Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with oppacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
