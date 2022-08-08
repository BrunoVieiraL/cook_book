import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late bool darkTheme;
  late SharedPreferences prefs;
  final String key = 'theme';

  ThemeProvider() {
    darkTheme = true;
    load();
  }

  bool get isDark => darkTheme;

  toggleTheme() {
    darkTheme = !darkTheme;
    save();
    notifyListeners();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  save() async {
    initPrefs();
    prefs.setBool('key', darkTheme);
  }

  load() async {
    await initPrefs();
    darkTheme = prefs.getBool('key') ?? true;
    notifyListeners();
  }
}
