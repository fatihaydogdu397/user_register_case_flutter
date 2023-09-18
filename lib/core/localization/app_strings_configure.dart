import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_register_case_flutter/core/init/locator.dart';
import 'package:user_register_case_flutter/core/keys/global_key.dart';
import 'package:user_register_case_flutter/core/localization/app_strings_delegate.dart';
import 'package:user_register_case_flutter/core/enum/language_code_enum.dart';
import 'package:user_register_case_flutter/core/localization/language_view_model.dart';

class AppStringsConfigure {
  final Locale _locale;
  Map<String, String> _localizedStrings = const {};
  static const LocalizationsDelegate<AppStringsConfigure> delegate = AppStringsDelegate();

  AppStringsConfigure(this._locale);

  static AppStringsConfigure of() {
    return Localizations.of<AppStringsConfigure>(GlobalContextKey.instance.globalKey.currentContext!, AppStringsConfigure) as AppStringsConfigure;
  }

  Future<void> loadStrings() async {
    serviceLocator<LanguageSettingsProvider>().init(_locale);
    final languageCode = serviceLocator<LanguageSettingsProvider>().languageCode;

    String jsonString;
    if (languageCode == LanguageCodeEnum.tr) {
      jsonString = await rootBundle.loadString("assets/langs/${languageCode.value}.json");
    } else {
      jsonString = await rootBundle.loadString("assets/langs/${languageCode.value}.json");
    }
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String getString(String key) => _localizedStrings[key] ?? '';
}
