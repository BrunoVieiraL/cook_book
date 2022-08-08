import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  
  save(bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('key', value);
  }
}
