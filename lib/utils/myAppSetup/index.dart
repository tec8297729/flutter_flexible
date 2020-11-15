// 初始化第三方插件
import '../tool/sp_util.dart';
import 'anaPageLoopInit.dart';

void myAppSetup() {
  anaPageLoopInit();

  SpUtil.getInstance(); // 本地缓存初始化
}
