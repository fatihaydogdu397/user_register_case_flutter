import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConstants {
  static String get fileName => ".env";

  static String get testApiBaseUrl => dotenv.get('testApiBaseUrl', fallback: "can't reach the testApiBaseUrl");
  static String get uatApiBaseUrl => dotenv.get('uatApiBaseUrl', fallback: "can't reach the uatApiBaseUrl");
  static String get prodApiBaseUrl => dotenv.get('prodApiBaseUrl', fallback: "can't reach the prodApiBaseUrl");
}
