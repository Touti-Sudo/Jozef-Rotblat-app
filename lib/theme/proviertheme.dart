import 'package:englishproject/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class Themeprovider with ChangeNotifier {
  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;
  bool _theme = false;
  List<Color> darkGradient = [
    Color(0xFF4A6FA5),
    Color.fromARGB(255, 58, 58, 58),
    Color(0xFFB8860B),
  ];
  List<Color> lightGradient = [
    Color(0xFFA7C7E7),
    Color(0xFFFFFFFF),
    Color(0xFFD4AF37),
  ];
  List<Color> get backgroundGradient => isDark ? darkGradient : lightGradient;
  bool get theme => _theme;
  Themeprovider() {
    _loadSettings();
  }
  void _loadSettings() {
    final box = Hive.box('theme');
    _theme = box.get('theme', defaultValue: false);
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggeletheme(bool value) {
    if (_themeData == lightmode) {
      themeData = darkmode;
      _theme = value;
      Hive.box('theme').put('theme', value);
      Hive.box('theme').put('themedata', themeData);
      notifyListeners();
    } else {
      themeData = lightmode;
      _theme = value;
      Hive.box('theme').put('theme', value);
      Hive.box('theme').put('themedata', themeData);
      notifyListeners();
    }
  }

  bool get isDark => _themeData == darkmode;
}
