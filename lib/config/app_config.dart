class AppConfig {
  // 是否开启dio接口请求打印
  static const DEBUG = true;

  /// 是否开启LogUtil类打印方法
  static const printFlag = true;

  /// 是否直接跳过闪屏页面，
  static const notSplash = false;

  /// 是否显示jh_debug浮动按钮
  static const showJhDebugBtn = true;

  /// dio请求前缀
  static String host = '/';

  /// 是否启用代理
  static const usingProxy = false;

  /// 代理的 ip 地址
  static const proxyAddress = '192.168.2.201';

  /// 代理端口
  static const proxyPort = 9999;
}
