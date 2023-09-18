import 'package:user_register_case_flutter/core/localization/app_strings_configure.dart';

class AppStrings {
  static String get createNewUser => AppStringsConfigure.of().getString('createNewUser');
  static String get updateUser => AppStringsConfigure.of().getString('updateUser');
  static String get userListScreen => AppStringsConfigure.of().getString('userListScreen');
  static String get name => AppStringsConfigure.of().getString('name');
  static String get surname => AppStringsConfigure.of().getString('surname');
  static String get phoneNumber => AppStringsConfigure.of().getString('phoneNumber');
  static String get identityNumber => AppStringsConfigure.of().getString('identityNumber');
  static String get salary => AppStringsConfigure.of().getString('salary');
  static String get birthDate => AppStringsConfigure.of().getString('birthDate');
  static String get update => AppStringsConfigure.of().getString('update');
  static String get delete => AppStringsConfigure.of().getString('delete');
  static String get create => AppStringsConfigure.of().getString('create');
  static String get identityValidatorError => AppStringsConfigure.of().getString('identityValidatorError');
}
