import 'package:book_library/app/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
   const PasswordTextFormField({
    super.key,
    required this.passwordController,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = true,
    this.errorText,
  });

  final TextEditingController passwordController;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: TextInputType.visiblePassword,
      controller: passwordController,
      obscureText: obscureText,
      validator: (input) =>
          input!.isEmpty ? "Please enter a valid password" : null,
      decoration: InputDecoration(
          errorText: errorText,
          errorMaxLines: 4,
          labelText: LocaleKeys.general_text_field_password_label.tr(),
          hintText: LocaleKeys.general_text_field_password_hint.tr(),
          suffixIcon: suffixIcon),
    );
  }
}
