import 'package:dio/dio.dart';
import '../../../config/app_config.dart';

/*
 * Log 拦截器
 */
class LogsInterceptors extends InterceptorsWrapper {
  // 请求拦截
  @override
  onRequest(RequestOptions options, handler) async {
    if (AppConfig.DEBUG) {
      print(
          """请求url：${options.baseUrl + options.path}\n请求类型：${options.method}\n请求头：${options.headers.toString()}""");
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    return handler.next(options);
  }

  // 响应拦截
  @override
  onResponse(response, handler) async {
    if (AppConfig.DEBUG) {
      print('返回参数: ' + response.toString());
    }

    return handler.next(response);
  }

  // 请求失败拦截
  @override
  onError(DioError err, handler) async {
    if (AppConfig.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response!.toString());
    }
    return handler.next(err);
  }
}
