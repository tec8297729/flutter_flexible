import '../routes/routeName.dart';

class AppConfig {
  /// 是否开启dio接口详细信息输出，以及其它相关插件调试信息
  static const DEBUG = true;

  /// 是否开启LogUtil类打印方法
  static const printFlag = true;

  /// 是否直接跳过闪屏页面，
  static const notSplash = false;

  /// 闪屏后跳转的页面（方便调试），需notSplash参数为true才有效果
  static String directPageName = RouteName.appHomePage;

  /// 是否显示jh_debug浮动按钮
  static const showJhDebugBtn = true;

  /// dio请求前缀
  static String host = '/';

  /// 是否启用代理，启用代理后，反向代理IP及端口才能生效
  static const usingProxy = false;

  /// 反向代理的IP/域名地址
  static const proxyAddress = '192.168.2.201';

  /// 反向代理端口
  static const proxyPort = 9003;
}
