import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:user_register_case_flutter/core/init/locator.dart' as locator;
import 'package:provider/provider.dart';
import 'package:user_register_case_flutter/core/localization/language_view_model.dart';
import 'package:user_register_case_flutter/app.dart';

Future<void> mainFunction() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await locator.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LanguageSettingsProvider>(
        create: (_) => locator.serviceLocator(),
      ),
    ],
    child: const App(),
  ));
}
