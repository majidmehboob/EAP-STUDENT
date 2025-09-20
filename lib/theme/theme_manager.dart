import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../utils/shared-preferences.dart';


class ThemeManager with ChangeNotifier {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal() {
    loadTheme();
  }

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeData => _themeMode;

  Future<void> loadTheme() async {
    final isDark = await AppSharedPreferences.getIsDarkMode();
    _applyTheme(isDark ?? false);
    notifyListeners();
  }

  void toggleTheme(bool isDark) {
    _applyTheme(isDark);
    AppSharedPreferences.setIsDarkMode(isDark);
    notifyListeners();
  }
  void _applyTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;


    CustomAppColors.update(isDark);
    CustomTextStyles.update();

    notifyListeners();
  }
}
