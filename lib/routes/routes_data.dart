import 'package:flutter/material.dart';
import 'route_name.dart';
import '../pages/error_page/error_page.dart';
import '../pages/app_main/app_main.dart';
import '../pages/splash/splash.dart';
import '../pages/test_demo/test_demo.dart';
import '../pages/Login/Login.dart';

final String initialRoute = RouteName.splashPage; // 初始默认显示的路由

final Map<String,
        StatefulWidget Function(BuildContext context, {dynamic params})>
    routesData = {
  // 页面路由定义...
  RouteName.appMain: (context, {params}) => AppMain(params: params),
  RouteName.splashPage: (context, {params}) => SplashPage(),
  RouteName.error: (context, {params}) => ErrorPage(params: params),
  RouteName.testDemo: (context, {params}) => TestDemo(params: params),
  RouteName.login: (context, {params}) => Login(params: params),
};
