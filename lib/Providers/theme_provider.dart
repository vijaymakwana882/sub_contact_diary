import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/theme_model.dart';

class themeProvider extends ChangeNotifier {
  ThemeDetails themeDetails = ThemeDetails(isDark: true);

  void changetheme() {
    themeDetails.isDark = !themeDetails.isDark;
    notifyListeners();
  }

  Future<void> setTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isDark', themeDetails.isDark);
    notifyListeners();
  }

  Future<void> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('isDark') == null || pref.getBool('isDark') == false) {
      themeDetails.isDark = false;
    } else {
      themeDetails.isDark = true;
    }
    notifyListeners();
  }
}
