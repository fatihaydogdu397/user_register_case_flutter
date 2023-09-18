import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/localization/app_strings_configure.dart';

class AppStringsDelegate extends LocalizationsDelegate<AppStringsConfigure> {
  const AppStringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['tr', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppStringsConfigure> load(Locale locale) async {
    AppStringsConfigure appLocalization = AppStringsConfigure(locale);
    await appLocalization.loadStrings();
    return appLocalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    return true;
  }
}
