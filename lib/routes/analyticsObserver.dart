import 'package:flutter/cupertino.dart';
import '../ioc/locator.dart' show AnalyticsService, locator;

/// 监听路由
class AnalyticsObserver extends NavigatorObserver {
  analytics(Route route, Route previousRoute) {
    locator.get<AnalyticsService>().appPush(route, previousRoute);
  }

  // push跳转路由时触发
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    analytics(route, previousRoute);
  }

  // pop回退路由时触发
  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    analytics(previousRoute, route);
  }

  // remove移除路由时触发
  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didRemove(route, previousRoute);
    analytics(route, previousRoute);
  }

  /// 路由被替换时触发
  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace();
    analytics(newRoute, oldRoute);
  }
}
