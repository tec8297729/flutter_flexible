import '../utils/index.dart';

/// 环境类型
enum ENV {
  DEV,
  TEST,
  PRE,
  PROD,
}

// dio请求前缀
final Map<ENV, String> _baseUrl = {
  ENV.DEV: 'https://urldev.com',
  ENV.TEST: 'https://urltest.com',
  ENV.PRE: 'https://urlpre.com',
  ENV.PROD: 'https://url.com',
};

/// app环境
class AppEnv {
  /// 当前环境变量
  ENV currentEnv = ENV.DEV;

  void init() {
    const envStr = String.fromEnvironment("INIT_ENV", defaultValue: "prod");
    switch (envStr) {
      case "dev":
        currentEnv = ENV.DEV;
        break;
      case "test":
        currentEnv = ENV.TEST;
        break;
      case "pre":
        currentEnv = ENV.PRE;
        break;
      case "prod":
        currentEnv = ENV.PROD;
        break;
      default:
        currentEnv = ENV.PROD;
    }
    LogUtil.d('当前环境$currentEnv');
  }

  /// 设置当前环境
  set setEnv(ENV env) {
    currentEnv = env;
  }

  /// 获取url前缀
  String get baseUrl {
    return _baseUrl[currentEnv] ?? '';
  }
}

AppEnv appEnv = AppEnv();
