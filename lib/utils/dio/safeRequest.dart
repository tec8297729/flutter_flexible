import 'dart:convert';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';

/// 底层请求方法说明
///
/// [options] dio请求的配置参数，默认get请求
///
/// [data] 请求参数
///
/// [cancelToken] 请求取消对象
///
///```dart
///CancelToken token = CancelToken(); // 通过CancelToken来取消发起的请求
///
///safeRequest(
///  "/test",
///  data: {"id": 12, "name": "xx"},
///  options: Options(method: "POST"),
/// cancelToken: token,
///);
///
///// 取消请求
///token.cancel("cancelled");
///```
Future safeRequest(
  String url, {
  Object data,
  Options options,
  Map<String, dynamic> queryParameters,
  CancelToken cancelToken,
}) async {
  try {
    BaseOptions baseOpts = new BaseOptions(
      baseUrl: AppConfig.host, // 前缀url
      // connectTimeout: 5000, // 连接服务器超时时间，单位是毫秒
      // receiveTimeout: 3000, // 接收数据的最长时限
      responseType: ResponseType.plain, // 数据类型
      // cookies: Iterable.empty(), // 可以添加一些公共cookie
      // maxRedirects: 2, // 重定向最大次数。
      // 当响应状态码不是成功状态(如404)时，是否接收响应内容，如果是false,则response.data将会为null
      receiveDataWhenStatusError: true,
    );

    Dio dioClient = new Dio(baseOpts); // 实例化请求，可以传入options参数
    if (AppConfig.usingProxy) {
      final adapter = dioClient.httpClientAdapter as DefaultHttpClientAdapter;
      adapter.onHttpClientCreate = (client) {
        // 设置Http代理
        client.findProxy = (uri) {
          return "PROXY ${AppConfig.proxyAddress}:${AppConfig.proxyPort}'";
        };
        // https证书校验
        client.badCertificateCallback = (cert, host, port) => true;
      };
    }

    dioClient.interceptors.addAll([
      new HeaderInterceptors(),
      new LogsInterceptors(),
    ]);

    return dioClient
        .request(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        )
        .then((data) => jsonDecode(data.data));
  } catch (e) {
    throw e;
  }
}
