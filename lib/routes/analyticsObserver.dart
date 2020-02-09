import 'package:flutter/cupertino.dart';

/// 监听路由
class AnalyticsObserver extends NavigatorObserver {
  /// 页面统计埋点处理
  umengAnalytics(Route newRoute, Route oldRoute) {
    String oldRouteName = oldRoute?.settings?.name; // 上一页面名称
    String newRouteName = newRoute?.settings?.name; // 当前页面名称
    // TODO: 数据埋点start（当前页）
    if (oldRouteName != null) {
      // TODO: 数据埋点end（上一页）
    }
  }

  // push跳转路由时触发
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    umengAnalytics(route, previousRoute);
  }

  // pop回退路由时触发
  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    umengAnalytics(previousRoute, route);
  }

  // remove移除路由时触发
  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didRemove(route, previousRoute);
    umengAnalytics(route, previousRoute);
  }

  /// 路由被替换时触发
  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace();
    umengAnalytics(newRoute, oldRoute);
  }
}
