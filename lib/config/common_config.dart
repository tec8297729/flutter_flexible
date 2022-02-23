import 'package:flutter/material.dart';

class CommonConfig {
  GlobalKey<NavigatorState> _globalKey = GlobalKey<NavigatorState>();

  /// 获取全局context
  BuildContext get getGlobalContext =>
      _globalKey.currentState?.overlay?.context as BuildContext;

  /// 设置全局key
  void saveGolbalKey(GlobalKey<NavigatorState> globalKey) {
    _globalKey = globalKey;
  }

  /// 获取全局Key
  GlobalKey<NavigatorState> get getGlobalKey => _globalKey;
}

CommonConfig commonConfig = CommonConfig();
