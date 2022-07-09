import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {}

class MyThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
    ),
  );
}
