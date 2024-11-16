import 'package:book_library/app/resources/radius_manager.dart';
import 'package:flutter/material.dart';

class ShapeManager {
  ShapeManager._();
  static ButtonStyle primaryTheme = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusManager.large.value)),
    minimumSize: const Size.fromHeight(44),
  );
}
