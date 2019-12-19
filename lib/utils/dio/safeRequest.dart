import 'dart:convert';
import 'package:dio/dio.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';

/// 请求方式
///
///```dart
///safeRequest(
///  "/test",
///  data: {"id": 12, "name": "xx"},
///  options: Options(method: "POST"),
///);
///```
Future safeRequest(String url, {Object data, Options options}) async {
  try {
    BaseOptions baseOpts = new BaseOptions(
      // baseUrl: '/', // 请求前缀url
      // connectTimeout: 5000, // 连接服务器超时时间，单位是毫秒
      // receiveTimeout: 3000, // 接收数据的最长时限
      responseType: ResponseType.plain, // 数据类型
      // cookies: Iterable.empty(), // 可以添加一些公共cookie
      // maxRedirects: 2, // 重定向最大次数。
      // 当响应状态码不是成功状态(如404)时，是否接收响应内容，如果是false,则response.data将会为null
      receiveDataWhenStatusError: true,
    );

    Dio dio = new Dio(baseOpts); // 实例化请求，可以传入options参数

    dio.interceptors.addAll([
      new HeaderInterceptors(),
      new LogsInterceptors(),
    ]);

    return dio
        .request(
          url,
          data: data,
          options: options,
        )
        .then((data) => jsonDecode(data.data));
  } catch (e) {
    throw e;
  }
}
