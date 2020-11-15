import 'package:dio/dio.dart';
import '../../../config/app_config.dart';

/*
 * header拦截器
 */
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.connectTimeout = 15000;
    options.baseUrl = AppConfig.host;
    return options;
  }

  // 响应拦截
  @override
  onResponse(Response response) async {
    return response;
  }
}
