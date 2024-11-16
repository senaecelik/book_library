// ignore_for_file: overridden_fields

import 'package:book_library/app/resources/shape_manager.dart';
import 'package:book_library/widget/button/outlined_primary_button.dart';
import 'package:flutter/material.dart';

final class OutlinedIconPrimaryButton extends OutlinedPrimaryButton {
  const OutlinedIconPrimaryButton({
    super.key,
    required super.child,
    required super.onPressed,
    required this.icon,
  });

  
  @override
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ShapeManager.primaryTheme,
      onPressed: onPressed,
      icon: icon,
      label: child,
    );
  }
}
