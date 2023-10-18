import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  bool isVisible = true;
  double maxHeight = 500.0;

  void minimizeMaximize() {
    isVisible = !isVisible;
    if (isVisible == false) {
      maxHeight = 50.0;
    } else {
      maxHeight = 500.0;
    }
    notifyListeners();
  }
}
