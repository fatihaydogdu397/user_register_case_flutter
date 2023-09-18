import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:user_register_case_flutter/core/keys/global_key.dart';
import 'package:user_register_case_flutter/core/localization/app_strings_configure.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/domain/router.dart' as router;
import 'package:user_register_case_flutter/core/utils/screen_size.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
          boldText: false,
        ),
        child: child!,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppStringsConfigure.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', ''),
        Locale('en', ''),
      ],
      onGenerateRoute: router.generateRoute,
      navigatorKey: GlobalContextKey.instance.globalKey,
    );
  }
}
