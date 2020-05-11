import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ota_update/ota_update.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/perm_utils.dart';
import '../../utils/util.dart';
import 'components/UpdateHeader.dart';
import 'components/UpdateInstr.dart';

export 'getNewAppVer.dart';

/// 更新APP组件
class UpdateAppVersion extends StatefulWidget {
  UpdateAppVersion({
    @required this.version,
    this.info,
    @required this.iosUrl,
    @required this.androidUrl,
    this.filename,
  });

  /// APP版本号
  final String version;

  /// 更新内容介绍
  final List<String> info;

  /// app下载后存储文件的名称
  final String filename;

  /// IOS应用更新地址
  final String iosUrl;

  /// 安卓apk下载地址
  final String androidUrl;

  @override
  _UpdateAppVersionState createState() => _UpdateAppVersionState();
}

class _UpdateAppVersionState extends State<UpdateAppVersion> {
  final double widthWrap = 550.w;
  bool downloadFlag = false; // 是否正在下载
  double downAppProgress = 0;
  String appVersion; // 最新版本号

  @override
  void initState() {
    super.initState();
    appVersion = widget.version;
  }

  /// APP版本更新
  void _updateVersion() async {
    if (Platform.isIOS) {
      String url = widget.iosUrl; // ios应用商店地址
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (Platform.isAndroid) {
      // 安卓apk下载地址
      String url = widget.androidUrl;
      try {
        OtaUpdate()
            .execute(url, destinationFilename: widget.filename ?? 'flutter.apk')
            .listen(
          (OtaEvent event) {
            switch (event.status) {
              case OtaStatus.DOWNLOADING: // 下载中
                setState(() {
                  downAppProgress = double.parse(event.value);
                });
                break;
              case OtaStatus.INSTALLING: //安装中
                setState(() {
                  downAppProgress = 100;
                });
                Navigator.pop(context);
                break;
              case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
                Util.toastTips('更新失败，请稍后再试');
                PermUtils.storagePerm(); // 权限申请
                break;
              default:
            }
          },
        );
      } catch (e) {
        LogUtil.d('更新失败，请稍后再试');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthWrap,
      height: 760.w,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          UpdateHeader(version: appVersion), // 头部
          UpdateInstr(data: widget?.info), // 更新内容
          bottomW(),
        ],
      ),
    );
  }

  /// 底部组件
  Widget bottomW() {
    Widget _child = upAppBtn();

    if (downloadFlag) {
      // 下载中，进度条
      _child = downProgressWidget();
    }

    return Container(
      width: double.infinity,
      height: 140.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_child],
      ),
    );
  }

  /// 进度条
  Widget downProgressWidget() {
    final double progWidth = 36.w;
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 360.w,
      child: PhysicalModel(
        color: Colors.transparent,
        // elevation: 2,
        borderRadius: BorderRadius.circular(8), // 裁剪圆度
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: progWidth,
          child: Stack(
            children: <Widget>[
              Container(
                height: progWidth,
                child: LinearProgressIndicator(
                  value: downAppProgress / 100, // 加载进度
                  valueColor: AlwaysStoppedAnimation(Color(0xff009FF9)),
                  backgroundColor: Colors.black12,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  downAppProgress > 0 ? '下载进度:$downAppProgress%' : '准备下载中...',
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 底部升级按钮
  Widget upAppBtn() {
    return Container(
      width: 300.w,
      height: 76.w,
      child: RaisedButton(
        child: Text(
          '立即升级',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 34.sp,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 4,
        color: Color(0xff009FF9),
        onPressed: () {
          _updateVersion(); // 版本检查及升级
          setState(() {
            downloadFlag = true;
          });
        },
      ),
    );
  }
}
