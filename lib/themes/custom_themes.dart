import 'package:flutter/material.dart';

class Themes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF280B57),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.4),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    dialogTheme: const DialogThemeData(backgroundColor: Colors.red),
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.white),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFDFDFD),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: const Color(0xFF7F52C7).withValues(alpha: 0.35),
      titleTextStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.black),
    ),
    dialogTheme: const DialogThemeData(backgroundColor: Color(0xFFD1C3DC)),
  );
}
