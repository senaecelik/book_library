

import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    super.key, required this.message,
    
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      
      textAlign: TextAlign.center,
      message,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ));
  }
}
