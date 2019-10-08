import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flexible/constants/themes/themeBlueGrey.dart';

part 'themeStore.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeData _themeData = themeBlueGrey;

  // 更新全局主题样式
  @action
  void setTheme(ThemeData themeName) {
    _themeData = themeName;
  }

  // 动态的去计算合并此值
  @computed
  ThemeData get getTheme => _themeData;
}
