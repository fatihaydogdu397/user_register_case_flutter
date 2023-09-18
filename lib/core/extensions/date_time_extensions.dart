import 'package:user_register_case_flutter/core/init/locator.dart';
import 'package:user_register_case_flutter/core/localization/language_view_model.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dMMMMYYYY {
    var outputFormat = DateFormat('d MMMM yyyy', serviceLocator<LanguageSettingsProvider>().languageCode.value);
    var outputDate = outputFormat.format(this);

    return outputDate;
  }
}
