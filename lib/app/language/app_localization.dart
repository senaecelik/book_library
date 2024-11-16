import 'package:book_library/app/utils/constant/enum/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable

/// Product localization manager
final class AppLocalization extends EasyLocalization {
  /// ProductLocalization neet to [child] for a wrap locale item
  AppLocalization({required super.child, super.key})
      : super(
            supportedLocales: _supportedItems,
            path: _translationPath,
            startLocale: Locales.tr.locale,
            useOnlyLangCode: true);

  static final List<Locale> _supportedItems = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _translationPath = 'assets/translations';

  /// Change project language by using [Locales]
  static Future<void> updateLanguage(
          {required BuildContext context, required Locales value}) =>

         
      context.setLocale(value.locale);
}
