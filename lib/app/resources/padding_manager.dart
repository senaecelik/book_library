import 'package:book_library/app/resources/values_manager.dart';
import 'package:flutter/material.dart';

final class PaddingManager extends EdgeInsets {
  const PaddingManager._() : super.all(0);

  /// All Padding
  /// [PaddingManager.allSmall] is 8
  PaddingManager.allSmall() : super.all(AppPadding.p8);

  /// [PaddingManager.allNormal] is 16
  PaddingManager.allNormal() : super.all(AppPadding.p16);

  /// [PaddingManager.allMedium] is 20
  PaddingManager.allMedium() : super.all(AppPadding.p20);

  /// [PaddingManager.allLarge] is 30
  PaddingManager.allLarge() : super.all(AppPadding.p30);
}
