import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static late SharedPreferences _preferences;
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static String themeMode = "darkMode";


  static Future setIsDarkMode(bool isDarkMode) => _preferences.setBool(themeMode, isDarkMode);
  static bool? getIsDarkMode() => _preferences.getBool(themeMode)??true;
}

