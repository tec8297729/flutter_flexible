import '../pages/ErrorPage/ErrorPage.dart';
import 'package:flutter/material.dart';
import 'routesData.dart'; // 路由页面定义

// 统一封装路由传递参数
Function onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name; // 当前传入的路由名称
  final Object args = settings.arguments; // 路由参数
  final Function pageContentBuilder = routesData[name]; // 获取路由指定组件函数
  final RouteSettings settingsData = RouteSettings(
    name: name,
    arguments: args,
  );

  // 容错路由
  if (pageContentBuilder == null) {
    // print('ERROR===>router was not fonuud!!!');
    return MaterialPageRoute(
      builder: (BuildContext context) => ErrorPage(params: args ?? null),
      settings: settingsData,
    );
  }

  // 默认跳转路由
  Route router = MaterialPageRoute(
    builder: (BuildContext context) {
      if (args != null) return pageContentBuilder(context, params: args);

      return pageContentBuilder(context);
    },
    settings: settingsData,
  );

  return router;
};
