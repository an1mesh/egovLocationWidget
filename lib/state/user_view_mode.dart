import 'dart:math';

import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  bool isVisible = true;
  bool isRotated = false;
  bool isClearVisible = false;
  bool isChecked = false;
  double maxHeight = 400.0;
  double maxWidth = 600.0;
  double angle = 0.0;

  List<String> searchResults = [
    'Kabul-Afghanistan',
    'Tirana-Albania',
    'Algiers-Algeria',
    'Andorra la Vella-Andorra',
    'Luanda-Angola',
    'St. John\'s-Antigua and Barbuda',
    'Buenos Aires-Argentina',
    'Yerevan-Armenia',
    'Canberra-Australia',
    'Baku-Azerbaijan',
    'Nassau-Bahamas',
    'Manama-Bahrain',
    'Dhaka-Bangladesh',
    'Bridgetown-Barbados',
    'Minsk-Belarus',
    'Brussels-Belgium',
    'Belmopan-Belize',
    'Porto-Novo-Benin',
    'Thimphu-Bhutan',
    'La Paz-Bolivia',
    'Sarajevo-Bosnia and Herzegovina',
    'Gaborone-Botswana',
    'Brasília-Brazil',
    'Bandar Seri Begawan-Brunei',
    'Sofia-Bulgaria',
    'Ouagadougou-Burkina Faso',
    'Bujumbura-Burundi',
    'Praia-Cabo Verde',
    'Phnom Penh-Cambodia',
    'Yaoundé-Cameroon',
    'Ottawa-Canada',
    'Bangui-Central African Republic',
    'NDjamena-Chad',
    'Santiago-Chile',
    'Beijing-China',
    'Bogotá-Colombia',
    'Moroni-Comoros',
    'Brazzaville-Congo',
    'San José-Costa Rica',
    'Zagreb-Croatia',
    'Havana-Cuba',
    'Nicosia-Cyprus',
    'Prague-Czech Republic',
    'Copenhagen-Denmark',
    'Djibouti-Djibouti',
    'Roseau-Dominica',
    'Santo Domingo-Dominican Republic',
    'Quito-Ecuador',
    'Cairo-Egypt',
    'San Salvador-El Salvador',
    'Malabo-Equatorial Guinea',
    'Asmara-Eritrea',
    'Tallinn-Estonia',
    'Addis Ababa-Ethiopia',
    'Suva-Fiji',
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
      isVisible = false;
      maxHeight = 40.0;
      isClearVisible = false;
      isChecked = false;
    } else {
      angle = 0.0;
      maxWidth = 600.0;
      isVisible = false;

      isClearVisible = false;
      isChecked = false;
      maxHeight = 40.0;
    }

    notifyListeners();
  }

  void searchQuery({required List<String> countries, required String query}) {
    searchResults = countries
        .where((country) => country.toLowerCase().contains(query.toLowerCase()))
        .toList();
    searchResults.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
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
