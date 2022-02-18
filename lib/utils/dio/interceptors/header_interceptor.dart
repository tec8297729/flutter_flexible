import 'package:dio/dio.dart';
import '../../../config/app_config.dart';

/*
 * header拦截器
 */
class HeaderInterceptors extends InterceptorsWrapper {
  // 请求拦截
  @override
  onRequest(RequestOptions options, handler) async {
    options.connectTimeout = 15000;
    options.baseUrl = AppConfig.host;
    return handler.next(options);
  }

  // 响应拦截
  @override
  onResponse(response, handler) {
    // Do something with response data
    return handler.next(response); // continue
  }

  // 请求失败拦截
  @override
  onError(err, handler) async {
    assert(err != null);
    return handler.next(err); //continue
  }
}
