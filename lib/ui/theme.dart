import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { DARK, LIGHT }

class ThemeState extends ChangeNotifier {
  bool _isDark = false;
  ThemeState() {
    getTheme().then((type) {
      _isDark = type == ThemeType.DARK;
      notifyListeners();
    });
  }
  ThemeType get theme => _isDark ? ThemeType.DARK : ThemeType.LIGHT;
  set theme(ThemeType type) => setTheme(type);
  void setTheme(ThemeType type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isDark = type == ThemeType.DARK;
    bool status = await preferences.setBool('isDark', _isDark);
    if (status) notifyListeners();
  }

  Future<ThemeType> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isDark = preferences.getBool("isDark") ?? false;
    return _isDark ? ThemeType.DARK : ThemeType.LIGHT;
  }
}
