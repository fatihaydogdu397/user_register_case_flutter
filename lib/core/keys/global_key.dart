import 'package:flutter/material.dart';

class GlobalContextKey {
  static GlobalContextKey instance = GlobalContextKey._init();
  GlobalContextKey._init() {
    currentNavigatorKey = globalKey;
  }
  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>(debugLabel: "globalKey");
  late GlobalKey<NavigatorState> currentNavigatorKey;
  void changeCurrentNavigatorKey(GlobalKey<NavigatorState> key) {
    currentNavigatorKey = key;
  }
}
