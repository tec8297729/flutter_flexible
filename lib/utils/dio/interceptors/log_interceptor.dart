import 'dart:io';
import 'package:dio/dio.dart';
import '../../../utils/util.dart';
import '../../../config/app_config.dart';
import '../dioErrorUtil.dart';

/*
 * Log 拦截器
 */
class LogsInterceptors extends InterceptorsWrapper {
  // 请求拦截
  @override
  onRequest(RequestOptions options) async {
    if (AppConfig.DEBUG) {
      LogUtil.d(
          """请求url：${options.path}\n请求类型：${options.method}\n请求头：${options.headers.toString()}""");
      if (options.data != null) {
        LogUtil.d('请求参数: ' + options.data.toString());
      }
    }
    return options;
  }

  // 响应拦截
  @override
  onResponse(Response response) async {
    if (AppConfig.DEBUG) {
      if (response != null) {
        LogUtil.d('返回参数: ' + response.toString());
      }
    }
    return response; // continue
  }

  // 请求失败拦截
  @override
  onError(DioError err) async {
    if (AppConfig.DEBUG) {
      LogUtil.d('请求异常: ' + err.toString());
      LogUtil.d('请求异常信息: ' + err.response?.toString() ?? "");
    }
    throw HttpException(DioErrorUtil.handleError(err));
    // return err; // continue;
  }
}
