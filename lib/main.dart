import 'package:book_library/app/app_initialize.dart';
import 'package:book_library/app/language/app_localization.dart';
import 'package:book_library/app/view/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitialize().make();
  runApp(AppLocalization(child: const MyApp()));
}
