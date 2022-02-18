import 'package:flutter/material.dart';
import '../layouts/basic_layout.dart';
import '../pages/error_page/error_page.dart';
import 'routes_data.dart'; // 路由页面定义

typedef RouterDataV = StatefulWidget Function(BuildContext context,
    {dynamic params});

// 统一封装路由传递参数
// ignore: prefer_function_declarations_over_variables
final generateRoute = (RouteSettings settings) {
  final String name = settings.name; // 当前传入的路由名称
  final Object args = settings.arguments; // 路由参数
  // typedef Type Name(params);
  final RouterDataV pageContentBuilder = routesData[name]; // 获取路由指定组件函数
  final RouteSettings settingsData = RouteSettings(
    name: name,
    arguments: args,
  );

  // 容错路由
  if (pageContentBuilder == null) {
    return MaterialPageRoute(
      builder: (BuildContext context) => BasicLayout(
        child: ErrorPage(params: args),
      ),
      settings: settingsData,
    );
  }

  // 默认跳转路由
  // ignore: strict_raw_type
  Route router = MaterialPageRoute(
    builder: (BuildContext context) {
      if (args != null) {
        return BasicLayout(
          child: pageContentBuilder(context, params: args),
        );
      }
      return BasicLayout(child: pageContentBuilder(context));
    },
    settings: settingsData,
  );

  return router;
};
