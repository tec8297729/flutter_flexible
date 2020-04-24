import '../../utils/log_util.dart';
import '../../ioc/locator.dart' show locator, CommonService;
import '../../utils/util.dart' show PermUtils, SpUtil;
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import '../../services/api.dart'; // 接口
import 'UpdateAppVersion.dart';

bool _showFlag = false;

/// 检查最新版本APP更新
///
/// [seconds] app多久检查更新，单位分钟，默认12小时
///
/// [forceUpdate] 是否强制更新, 直接显示弹层，默认false
Future getNewAppVer({int seconds = 360 * 12, bool forceUpdate = false}) async {
  if (!(await PermUtils.storagePerm())) return; // 权限申请
  try {
    if (_showFlag) return;
    LogUtil.d('检查APP更新开始');

    CommonService _commonIoc = locator.get<CommonService>();
    const String spKey = 'checkAppVerTime'; // 缓存key
    DateTime newTime = new DateTime.now(); // 当前时间
    String oldTimeStr = SpUtil.getData<String>(
      spKey,
      defValue: newTime.add(Duration(seconds: -10)).toString(),
    );
    DateTime oldTime = DateTime.parse(oldTimeStr);
    Duration diffTime = newTime.difference(oldTime);

    // 指定时间内不在触发检查更新APP
    if (!forceUpdate) {
      if (diffTime.inSeconds < seconds) {
        _showFlag = false;
        return;
      }
    }

    // TODO:获取最新APP版本, 自定义getNewVersion接口获取
    Map resData = await getNewVersion();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // APP版本号对比检查
    if (resData['version'] == packageInfo.version && !forceUpdate) return;
    _showFlag = true;
    // 弹层更新
    showGeneralDialog(
      context: _commonIoc.getGlobalContext,
      barrierDismissible: true, // 是否点击其他区域消失
      barrierLabel: "",
      barrierColor: Colors.black54, // 遮罩层背景色
      transitionDuration: Duration(milliseconds: 150), // 弹出的过渡时长
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        // 显示的动画组件
        return ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(animation),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.transparent, // 背景颜色
          child: UpdateAppVersion(
            // TODO: 传入新版本APP相关参数、版本号、更新内容、下载地址等
            version: resData['version'] ?? '', // 版本号
            info: (resData['info'] as List).cast<String>() ?? [], // 更新内容介绍
            // ios是苹果应用商店地址
            iosUrl: 'itms-apps://itunes.apple.com/cn/app/id414478124?mt=8',
            androidUrl:
                'https://b6.market.xiaomi.com/download/AppStore/08fee50a2945783f419a5945f8e89707f2640c6b0/com.ss.android.ugc.aweme.apk',
          ),
        );
      },
    ).then((v) {
      _showFlag = false;
    });

    await SpUtil.setData(spKey, newTime.toString());
  } catch (e) {
    _showFlag = false;
  }
}
