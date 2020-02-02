import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:package_info/package_info.dart';
import '../components/UpdateAppVersion/UpdateAppVersion.dart';
import '../service/service_method.dart';
import 'sp_util.dart';

class Util {
  /// 防抖函数
  static Function debounce(Function fn, [int t = 30]) {
    Timer _debounce;
    return (data) {
      // 还在时间之内，抛弃上一次
      if (_debounce?.isActive ?? false) _debounce.cancel();

      _debounce = Timer(Duration(milliseconds: t), () {
        fn(data);
      });
    };
  }

  /// tosat提示
  static toastTips(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.CENTER, // 提示位置
      fontSize: 18, // 提示文字大小
    );
  }

  /// 检查最新版本APP更新
  ///
  /// [hours] app多久检查更新，默认12小时，未到指定时间内，使用此函数不在请求接口
  ///
  /// [forceUpdate] 是否强制更新, 直接显示弹层，默认false
  Future getNewAppVer({int hours = 12, bool forceUpdate = false}) async {
    const String spKey = 'checkAppVerTime'; // 缓存key
    DateTime newTime = new DateTime.now(); // 当前时间
    String newTimeStr = newTime.toString();
    String oldTimeStr = SpUtil.getData<String>(spKey, defValue: newTimeStr);
    DateTime oldTime = DateTime.parse(oldTimeStr);
    Duration diffTime = newTime.difference(oldTime);

    // 指定时间内不在触发检查更新APP
    if (!(diffTime.inHours >= hours) && !forceUpdate) return;

    // TODO:获取最新APP版本, 自定义getNewVersion接口获取
    Map resData = await getNewVersion();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // APP版本号对比检查
    if (resData['version'] == packageInfo.version && !forceUpdate) return;

    // 弹层更新
    showDialog(
      context: jhDebug.getNavigatorKey.currentState.overlay.context,
      child: Dialog(
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
      ),
    );

    await SpUtil.setData(spKey, newTimeStr);
  }
}
