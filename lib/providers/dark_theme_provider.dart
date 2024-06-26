import 'package:flutter/material.dart';
import 'package:projects/utlis/theme/dark_theme.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkTheme darkThemePreference = DarkTheme();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
