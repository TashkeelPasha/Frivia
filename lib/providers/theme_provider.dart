import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Pacifico',
    colorScheme:
        const ColorScheme.light(surface: Colors.white, primary: Colors.black));

ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Pacifico',
    colorScheme:
        const ColorScheme.dark(surface: Colors.black, primary: Colors.white));

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode;
  bool isDark = true;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => isDark;
  set themeData(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

  void toggle() {
    _themeData = _themeData == lightmode ? darkmode : lightmode;
    notifyListeners();
  }
}
