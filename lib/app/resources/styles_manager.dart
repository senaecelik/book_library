import 'package:book_library/app/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight? fontWeight, ) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
 );
}

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: _getTextStyle(57, FontManager.fontFamily,
        FontWeightManager.regular, ),
    displayMedium: _getTextStyle(45, FontManager.fontFamily,
        FontWeightManager.regular, ),
    displaySmall: _getTextStyle(36, FontManager.fontFamily,
        FontWeightManager.regular,),
    headlineLarge: _getTextStyle(36, FontManager.fontFamily,
        FontWeightManager.regular,),
    headlineMedium: _getTextStyle(30, FontManager.fontFamily,
        FontWeightManager.regular,),
    headlineSmall: _getTextStyle(24, FontManager.fontFamily,
        FontWeightManager.regular,),
    titleLarge: _getTextStyle(16, FontManager.fontFamily,
        FontWeightManager.medium, ),
    labelLarge: _getTextStyle(14, FontManager.fontFamily,
        FontWeightManager.medium, ),
    labelMedium: _getTextStyle(12, FontManager.fontFamily,
        FontWeightManager.medium, ),
    labelSmall: _getTextStyle(11, FontManager.fontFamily,
        FontWeightManager.medium, ),
    bodyLarge: _getTextStyle(16, FontManager.fontFamily,
        FontWeightManager.regular, ),
    bodyMedium: _getTextStyle(14, FontManager.fontFamily,
        FontWeightManager.regular, ),
    bodySmall: _getTextStyle(11, FontManager.fontFamily,
        FontWeightManager.regular, ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: _getTextStyle(57, FontManager.fontFamily,
        FontWeightManager.regular, ),
    displayMedium: _getTextStyle(45, FontManager.fontFamily,
        FontWeightManager.regular, ),
    displaySmall: _getTextStyle(36, FontManager.fontFamily,
        FontWeightManager.regular, ),
    headlineLarge: _getTextStyle(36, FontManager.fontFamily,
        FontWeightManager.regular, ),
    headlineMedium: _getTextStyle(28, FontManager.fontFamily,
        FontWeightManager.regular, ),
    headlineSmall: _getTextStyle(24, FontManager.fontFamily,
        FontWeightManager.regular, ),
    titleLarge: _getTextStyle(16, FontManager.fontFamily,
        FontWeightManager.medium, ),
    labelLarge: _getTextStyle(14, FontManager.fontFamily,
        FontWeightManager.medium, ),
    labelMedium: _getTextStyle(12, FontManager.fontFamily,
        FontWeightManager.medium, ),
    labelSmall: _getTextStyle(11, FontManager.fontFamily,
        FontWeightManager.medium, ),
    bodyLarge: _getTextStyle(16, FontManager.fontFamily,
        FontWeightManager.regular, ),
    bodyMedium: _getTextStyle(14, FontManager.fontFamily,
        FontWeightManager.regular, ),
    bodySmall: _getTextStyle(11, FontManager.fontFamily,
        FontWeightManager.regular, ),
  );
}
