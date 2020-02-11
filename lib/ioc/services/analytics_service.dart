import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

/// 埋点统计，闪屏页面路由不统计，需要自己手动埋点
class AnalyticsService {
  Route newRouteConfig;
  Route oldRouteConfig;
  Lock lock = new Lock();

  // 处理数据埋点上报
  _buriedPrint(Route newRoute, Route oldRoute) async {
    await lock.synchronized(() {
      String newRouteName = newRoute?.settings?.name;
      String oldRouteName = oldRoute?.settings?.name;

      if (newRouteName == null ||
          oldRouteName == null ||
          newRouteName == oldRouteName) {
        return;
      }

      // TODO: 开始统计当前页面 newRouteName

      if (oldRouteName != null) {
        // TODO: 结束统计上一页面 oldRouteName
      }
    });
  }

  /// 统计页面正常跳转
  appPush(Route newRoute, Route oldRoute) async {
    await _buriedPrint(newRoute, oldRoute);
    newRouteConfig = newRoute;
    oldRouteConfig = oldRoute;
  }

  // app后台状态统计
  appPaused() async {
    _buriedPrint(newRouteConfig, oldRouteConfig);
  }
}
