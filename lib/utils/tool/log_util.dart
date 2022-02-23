import '../../config/app_env.dart' show appEnv, ENV_TYPE;

class LogUtil {
  static d(Object? data) {
    if (appEnv.currentEnv != ENV_TYPE.PROD) {
      print(data);
    }
  }
}
