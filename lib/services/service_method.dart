import 'package:dio/dio.dart';
import '../utils/dio/safeRequest.dart';
import 'service_url.dart';

/// 获取APP最新版本号, 可指定版本号,传入版本号'1.0.0'测试
Future<Map> getNewVersion([String version]) async {
  Map resData = await safeRequest(
    servicePath['appVersion'],
    queryParameters: {'version': version},
    options: Options(method: 'GET'),
  );

  return resData['data'] ?? {};
}
