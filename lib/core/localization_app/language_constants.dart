import 'dart:ui';

import 'package:get/get.dart';

import 'locale_keys.dart';

class LanguageConstants {

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'AR'),
  ];

  static Map<String, String> getLanguageOptions() {
    return {
      'en': LocaleKeys.english.tr,
      'ar': LocaleKeys.arabic.tr,
    };
  }
}
