import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    init();
  }

  void init() {}
  bool isLoading = false;

  void refreshView() {
    notifyListeners();
  }
}
