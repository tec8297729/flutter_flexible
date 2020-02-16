import '../config/app_config.dart';

class LogUtil {
  static d(Object data) {
    if (AppConfig.printFlag) {
      print(data);
    }
  }
}
