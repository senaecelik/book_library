import 'package:book_library/app/resources/radius_manager.dart';
import 'package:book_library/app/resources/styles_manager.dart';
import 'package:book_library/app/theme/base/app_color_scheme.dart';
import 'package:book_library/app/theme/base/base_app_theme.dart';
import 'package:flutter/material.dart';

final class AppDarkTheme implements AppTheme {
  @override
  ThemeData get themeData => ThemeData(
      useMaterial3: true,
      colorScheme: AppColorScheme.darkColorScheme,
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
       inputDecorationTheme: inputDecorationTheme);

  @override
  final TextButtonThemeData textButtonThemeData = TextButtonThemeData(
      style: TextButton.styleFrom(
    textStyle: TTextTheme.darkTextTheme.bodyLarge,
  ));

  @override
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusManager.small.value)),
  );
  
  @override
  ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
   style: ElevatedButton.styleFrom(
    maximumSize: const Size(double.infinity, 50)
   ) 
  );
}
