import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

   toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
    ),
  );
}
