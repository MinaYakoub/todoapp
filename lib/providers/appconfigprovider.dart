import 'package:flutter/material.dart';
class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  void changeAppLang(String newlang) {
    if (newlang == appLanguage) {
      return;
    } else {
      appLanguage = newlang;
    }
    notifyListeners();
  }

  void changeAppTheme(ThemeMode newMode) {
    if (newMode == appTheme) {
      return;
    } else {
      appTheme = newMode;
    }
    notifyListeners();
  }
}
