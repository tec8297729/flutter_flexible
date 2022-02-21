import '../utils/index.dart';

enum ENV_TYPE {
  DEV,
  TEST,
  PRE,
  PROD,
}

// dio请求前缀
final Map<ENV_TYPE, String> _baseUrl = {
  ENV_TYPE.DEV: 'https://urldev.com',
  ENV_TYPE.TEST: 'https://urltest.com',
  ENV_TYPE.PRE: 'https://urlpre.com',
  ENV_TYPE.PROD: 'https://url.com',
};

/// app环境
class AppEnv {
  /// 当前环境变量
  ENV_TYPE currentEnv = ENV_TYPE.DEV;

  void init() {
    const envStr = String.fromEnvironment("INIT_ENV", defaultValue: "prod");
    switch (envStr) {
      case "dev":
        currentEnv = ENV_TYPE.DEV;
        break;
      case "test":
        currentEnv = ENV_TYPE.TEST;
        break;
      case "pre":
        currentEnv = ENV_TYPE.PRE;
        break;
      case "prod":
        currentEnv = ENV_TYPE.PROD;
        break;
      default:
        currentEnv = ENV_TYPE.PROD;
    }
    LogUtil.d('当前环境$currentEnv');
  }

  /// 设置当前环境
  set setEnv(ENV_TYPE env) {
    currentEnv = env;
  }

  /// 获取url前缀
  String get baseUrl {
    return _baseUrl[currentEnv] ?? '';
  }
}

AppEnv appEnv = AppEnv();
