import 'package:dio/dio.dart';
import 'package:flexible/utils/dio/safeRequest.dart';
import 'service_url.dart';

// 测试请求接口
Future getHomeData() async {
  print('开始获取首页数据......');
  return safeRequest(
    servicePath['homePageContent'],
    options: Options(method: 'POST'),
  );
}
