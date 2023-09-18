import 'package:user_register_case_flutter/core/enum/flavor.dart';

import '../core/constants/environment_constants.dart';

class AppConfig {
  String baseUrl = EnvironmentConstants.prodApiBaseUrl;
  Flavor flavor = Flavor.prod;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String baseUrl = "",
    Flavor flavor = Flavor.prod,
  }) {
    return shared = AppConfig(baseUrl, flavor);
  }

  AppConfig(this.baseUrl, this.flavor);
}
