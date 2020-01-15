import 'package:flutter/material.dart';
import '../pages/ErrorPage/ErrorPage.dart';
import '../pages/HomeBarTabs/HomeBarTabs.dart';
import '../pages/SplashPage/SplashPage.dart';
import '../pages/TestDemo/TestDemo.dart';

final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesInit = {
  // 页面路由定义...
  '/': (BuildContext context, {params}) => SplashPage(),
  '/home': (BuildContext context, {params}) => HomeBarTabs(params: params),
  '/error': (BuildContext context, {params}) => ErrorPage(params: params),
  '/testDemo': (BuildContext context, {params}) => TestDemo(params: params),
};
