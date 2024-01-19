import 'package:flutter/material.dart';
import 'package:flutter_music_appl/themes/dark_mode.dart';
import 'package:flutter_music_appl/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initially light mode
  ThemeData _themeData = lightMode;

  //get dark mode
  ThemeData get themeData => _themeData;

  // is darkmode!
  bool get isDrakMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //update the UI
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
