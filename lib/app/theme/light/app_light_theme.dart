import 'package:book_library/app/resources/radius_manager.dart';
import 'package:book_library/app/resources/styles_manager.dart';
import 'package:book_library/app/theme/base/app_color_scheme.dart';
import 'package:book_library/app/theme/base/base_app_theme.dart';
import 'package:flutter/material.dart';

// Custom App Ligth Theme
final class AppLightTheme implements AppTheme {
  @override
  ThemeData get themeData => ThemeData(
      useMaterial3: true,
      colorScheme: AppColorScheme.lightColorScheme,
      textTheme: TTextTheme.lightTextTheme,
      brightness: Brightness.light,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: elevatedButtonThemeData
      
      );

  @override
  final TextButtonThemeData textButtonThemeData = TextButtonThemeData(
      style: TextButton.styleFrom(
    textStyle: TTextTheme.lightTextTheme.bodyLarge,
  ));

  @override
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusManager.small.value)),
  );
  
  @override
  ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
   style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber,
    maximumSize: const Size(double.infinity, 50)
   ) 
  );


}
