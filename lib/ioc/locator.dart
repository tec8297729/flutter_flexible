import 'package:get_it/get_it.dart';
import 'services/common_serivce.dart';

// 统一导出容器实例
export 'services/common_serivce.dart' show CommonService;

GetIt locator = GetIt.instance;

// 注入容器函数
void setupLocator() {
  locator.registerLazySingleton<CommonService>(() => CommonService());
}
