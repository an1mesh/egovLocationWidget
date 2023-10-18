import 'dart:math';

import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  bool isVisible = true;
  bool isRotated = false;
  double maxHeight = 300.0;
  double maxWidth = 400.0;
  double angle = 0.0;

  void minimizeMaximize() {
    isVisible = !isVisible;
    if (isVisible == false) {
      maxHeight = 50.0;
    } else {
      maxHeight = 300.0;
    }
    notifyListeners();
  }

  void rotate() {
    isRotated = !isRotated;
    if (angle == 0.0) {
      angle = 3 * pi / 2;
      maxWidth = 200.0;
    } else {
      angle = 0.0;
      maxWidth = 400.0;
    }

    notifyListeners();
  }
}
