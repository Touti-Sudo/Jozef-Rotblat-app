import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  colorScheme: ColorScheme.light(
    surface: Colors.grey[800] ?? Colors.grey,
    primary: Colors.grey[200] ?? Colors.grey,
    background: Color(0xFFA7C7E7),
    secondary: Colors.lightBlue,
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color.fromARGB(255, 114, 114, 114),
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 0, 0, 0) ?? Colors.grey,
    primary: Colors.grey[800] ?? Colors.grey,
    background: Color.fromARGB(255, 64, 98, 148),
    secondary: Colors.lightBlue,
  ),
);
