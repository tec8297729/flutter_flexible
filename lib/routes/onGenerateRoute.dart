import 'package:flutter/material.dart';
import 'routesInit.dart'; // 路由页面定义

// 统一封装路由传递参数（支持别名跳转路由）
Function onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name; // 当前传入的路由名称
  final Object args = settings.arguments; // 路由参数
  final Function pageContentBuilder = routesInit[name]; // 获取路由指定组件函数

  // 没有指定路由配置时
  if (pageContentBuilder == null) return null;
  // 默认跳转路由
  Route router = MaterialPageRoute(
    builder: (BuildContext context) => pageContentBuilder(context),
  );
  // 跳转路由有参数情况下
  if (args != null) {
    router = MaterialPageRoute(
      // 附加传递参数给指定路由组件
      builder: (context) => pageContentBuilder(context, params: args),
    );
    return router;
  }
  return router;
};
