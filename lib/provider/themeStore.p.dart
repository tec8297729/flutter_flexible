import 'package:flutter/material.dart';
import '../constants/themes/index_theme.dart';

// Provider状态管理使用
class ThemeStore with ChangeNotifier {
  ThemeData _themeData = themeBlueGrey;

  // 更新全局主题样式
  void setTheme(ThemeData themeName) {
    _themeData = themeName;
    notifyListeners();
  }

  ThemeData get getTheme => _themeData;
}
