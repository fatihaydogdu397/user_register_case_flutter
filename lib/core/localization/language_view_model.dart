import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/enum/language_code_enum.dart';

class LanguageSettingsProvider with ChangeNotifier {
  late LanguageCodeEnum languageCode;

  void init(Locale deviceLocalLanguage) {
    LanguageCodeEnum localeCode = LanguageCodeEnum.tr.stringToLanguageCode(deviceLocalLanguage.languageCode);
    languageCode = localeCode;
  }
}
