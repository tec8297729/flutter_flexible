enum ENV_TYPE {
  DEV,
  TEST,
  PRE,
  PROD,
}

/// app环境
class AppEnv {
  /// 当前环境变量
  static ENV_TYPE currentEnv;

  static init() {
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
  }

  /// 请求url前缀
  static String baseUrl = {
    ENV_TYPE.DEV: 'https://apidev.jonhuu.com',
    ENV_TYPE.TEST: 'https://apitest.jonhuu.com',
    ENV_TYPE.PRE: 'https://apipre.jonhuu.com',
    ENV_TYPE.PROD: 'https://api.jonhuu.com',
  }[currentEnv];
}
