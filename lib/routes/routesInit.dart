import 'package:flexible/pages/ErrorPage/ErrorPage.dart';
import 'package:flutter/material.dart';
// 以下各路由页面显示的组件
import 'package:flexible/pages/BarTabs/BarTabs.dart';
import 'package:flexible/pages/TestMobx/TestMobx.dart';

final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesInit = {
  // 页面路由定义...
  '/': (BuildContext context, {params}) => BarTabs(params: params),
  '/error': (BuildContext context, {params}) => ErrorPage(params: params),
  '/testMobx': (BuildContext context, {params}) => TestMobx(params: params),
};
