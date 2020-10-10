import 'package:flutter/material.dart';
import 'routeName.dart';
import '../pages/ErrorPage/ErrorPage.dart';
import '../pages/AppHomePage/AppHomePage.dart';
import '../pages/SplashPage/SplashPage.dart';
import '../pages/TestDemo/TestDemo.dart';
import '../pages/UserLogin/Login.dart';
import '../pages/UserLogin/Register.dart';

final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesData = {
  // 页面路由定义...
  RouteName.splashPage: (context, {params}) => SplashPage(),
  RouteName.appHomePage: (context, {params}) => AppHomePage(params: params),
  RouteName.error: (context, {params}) => ErrorPage(params: params),
  RouteName.testDemo: (context, {params}) => TestDemo(params: params),
  RouteName.login: (context, {params}) => Login(),
  RouteName.register: (context, {params}) => Register(),
};
