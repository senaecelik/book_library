
import 'package:book_library/app/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        labelText: LocaleKeys.general_text_field_email_label.tr(),
        hintText: LocaleKeys.general_text_field_email_hint.tr(),
      ),
      validator: (input) =>
          input!.isEmpty ? "Please enter a valid email" : null,
    );
  }
}
