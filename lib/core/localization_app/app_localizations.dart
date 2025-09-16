import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'language_constants.dart';

class AppLocalizations {
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales =
      LanguageConstants.supportedLocales;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
}
