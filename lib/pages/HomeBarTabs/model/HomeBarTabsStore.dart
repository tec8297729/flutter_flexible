import 'package:flutter/material.dart';

class HomeBarTabsStore extends ChangeNotifier {
  PageController barTabsController;

  /// 保存页面控制器
  saveController(PageController barTabsCont) => barTabsController = barTabsCont;

  /// 获取BarTabs的Controller控制器
  PageController get getBarTabsCont => barTabsController;
}
