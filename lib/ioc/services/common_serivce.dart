import 'package:flutter/material.dart';

class CommonService {
  GlobalKey<NavigatorState> _globalKey = GlobalKey<NavigatorState>();

  /// 获取全局context
  BuildContext get getGlobalContext =>
      _globalKey?.currentState?.overlay?.context;

  /// 设置全局key
  saveGolbalKey(GlobalKey<NavigatorState> globalKey) {
    _globalKey = globalKey;
  }

  /// 获取全局Key
  GlobalKey get getGlobalKey => _globalKey;
}
