import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamy/core/localization_app/language_constants.dart';
import 'package:islamy/core/prefs/shared_pref_controller.dart';

class LocalizeController extends GetxController {
  final SharedPrefController _prefs = SharedPrefController();

  /// Returns app locale with fallback logic:
  /// 1. Uses saved language if exists
  /// 2. Falls back to device language
  /// 3. Defaults to English if all else fails
  Locale get initialLocale {
    final langCode = _prefs.language;
    if (isLanguageSupported(langCode)) {
      return Locale(langCode);
    }
    return Get.deviceLocale ?? const Locale('en', 'US');
  }

  bool isLanguageSupported(String code) {
    return LanguageConstants.supportedLocales
        .any((locale) => locale.languageCode == code);
  }

  Future<void> changeLocale(String codeLang) async {
    if (!isLanguageSupported(codeLang)) return;

    try {
      await _prefs.changeLanguage(codeLang);
      await Get.updateLocale(Locale(codeLang));
    } catch (e) {
      Get.snackbar(
        'Error'.tr,
        'Failed to change language'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
