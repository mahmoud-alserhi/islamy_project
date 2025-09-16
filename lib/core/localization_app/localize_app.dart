import 'package:get/get.dart';

import 'english_language.dart';
import 'arabic_language.dart';


class LocalizeApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': englishLanguage(),
        'ar': arabicLanguage(),
      };
}
