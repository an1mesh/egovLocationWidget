import 'dart:math';

import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  bool isVisible = true;
  bool isRotated = false;
  bool isClearVisible = false;
  bool isChecked = false;
  double maxHeight = 400.0;
  double maxWidth = 400.0;
  double angle = 0.0;

  List<String> searchResults = [
    'India',
    'Canada',
    'America',
    'England',
    'Australia'
  ];

  void minimizeMaximize() {
    isVisible = !isVisible;
    if (isVisible == false) {
      isClearVisible = false;
      maxHeight = 50.0;
    } else {
      maxHeight = 400.0;
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

  void searchQuery({required List<String> countries, required String query}) {
    searchResults = countries
        .where((country) => country.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void clearList() {
    searchResults = [];
    isClearVisible = false;
    notifyListeners();
  }

  void isClearVisibleCheck(String query) {
    if (query == '') {
      isClearVisible = false;
    } else {
      isClearVisible = true;
    }
    notifyListeners();
  }

  void toggleCheckBox() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
