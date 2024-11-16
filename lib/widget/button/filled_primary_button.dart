import 'package:book_library/app/resources/shape_manager.dart';
import 'package:flutter/material.dart';

class FilledPrimaryButton extends StatelessWidget {
  const FilledPrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isDisable =false, this.icon,
  }) ;

  
  final Widget child;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon ?? const SizedBox.shrink(),
      style: ShapeManager.primaryTheme,
      onPressed: isDisable ? null : onPressed,
      label: child,
    );
  }
}
