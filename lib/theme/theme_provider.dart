import 'package:CureHelper/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _isDarkMode ? darkMode : lightMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
