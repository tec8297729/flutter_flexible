import '../utils/index.dart';

enum ENV_TYPE {
  DEV,
  TEST,
  PRE,
  PROD,
}

final Map<ENV_TYPE, String> _baseUrl = {
  ENV_TYPE.DEV: 'https://lumiereapitest.kaikeba.com',
  ENV_TYPE.TEST: 'https://lumiereapitest.kaikeba.com',
  ENV_TYPE.PRE: 'https://lumiereapi.kaikeba.com',
  ENV_TYPE.PROD: 'https://lumiereapi.kaikeba.com',
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
    return _baseUrl[currentEnv];
  }
}

AppEnv appEnv = AppEnv();
