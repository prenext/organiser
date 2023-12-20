import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeOption { light, dark, systemDefault }

class ThemeProvider with ChangeNotifier {
  ThemeModeOption _currentThemeMode = ThemeModeOption.light;

  ThemeModeOption get currentThemeMode => _currentThemeMode;

  Future<void> setThemeMode(ThemeModeOption mode) async {
    _currentThemeMode = mode;
    notifyListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.toString());
  }

  Future<void> loadThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedMode = prefs.getString('themeMode');

    if (savedMode != null) {
      _currentThemeMode = ThemeModeOption.values
          .firstWhere((mode) => mode.toString() == savedMode);
    }

    notifyListeners();
  }
}
