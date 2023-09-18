import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:user_register_case_flutter/config/config.dart';
import 'package:user_register_case_flutter/core/constants/environment_constants.dart';
import 'package:user_register_case_flutter/core/enum/flavor.dart';
import 'package:user_register_case_flutter/main_function.dart';

void main() async {
  await dotenv.load(fileName: EnvironmentConstants.fileName);
  AppConfig.create(
    baseUrl: EnvironmentConstants.testApiBaseUrl,
    flavor: Flavor.test,
  );
  mainFunction();
}
