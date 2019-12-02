import 'package:flutter/material.dart';
import 'package:flexible/constants/themes/themeBlueGrey.dart';

class ThemeStore with ChangeNotifier {
  ThemeData _themeData = themeBlueGrey;

  // 更新全局主题样式
  void setTheme(ThemeData themeName) {
    _themeData = themeName;
    notifyListeners();
  }

  ThemeData get getTheme => _themeData;
}
