import 'package:ana_muslim/service/theme_prefs.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefs themePrefs = ThemePrefs();

  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    themePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
