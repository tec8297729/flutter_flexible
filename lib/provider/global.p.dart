import 'package:flutter/material.dart';

class GlobalStore extends ChangeNotifier {
  late PageController barTabsController;
  bool _grayTheme = false;

  /// 保存页面控制器
  void saveController(PageController barTabsCont) =>
      barTabsController = barTabsCont;

  /// 获取BarTabs的Controller控制器
  PageController get getBarTabsCont => barTabsController;

  /// 是否显示灰度模式主题，true为灰度, false显示原有主题颜色
  bool setGrayTheme([bool flag = false]) {
    _grayTheme = flag;
    notifyListeners();
    return _grayTheme;
  }

  /// 是否是灰度模式
  bool get getGrayTheme => _grayTheme;
}
