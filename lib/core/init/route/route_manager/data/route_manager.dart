import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/domain/repository/i_route_manager.dart';
import 'package:user_register_case_flutter/core/keys/global_key.dart';

class Go implements IRouteManager {
  static Go to = Go._init();
  Go._init();
  bool get hasRootNavigation => GlobalContextKey.instance.globalKey.currentState?.canPop() ?? false;

  @override
  Future page(
    String routeName, {
    Object? argument,
    bool rootNavigator = false,
    bool controlLogin = false,
  }) async {
    Navigator.of(
      GlobalContextKey.instance.currentNavigatorKey.currentContext!,
      rootNavigator: hasRootNavigation ? true : rootNavigator,
    ).pushNamed(routeName, arguments: argument);
  }

  @override
  void back({Object? argument, GlobalKey<NavigatorState>? currentNavigatorKey}) {
    var navigatorKey = currentNavigatorKey ?? GlobalContextKey.instance.currentNavigatorKey;
    if (navigatorKey.currentContext != null) {
      return Navigator.of(navigatorKey.currentContext!).pop(argument);
    }
  }
}
