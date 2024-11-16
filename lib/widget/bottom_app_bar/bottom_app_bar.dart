import 'package:flutter/material.dart';

class BottomRowAppBar extends BottomAppBar {
  const BottomRowAppBar({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonText,
  });

  final String text;
  final VoidCallback onPressed;
  final String buttonText;

  Widget build(BuildContext context) {
    return BottomAppBar( 
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
