import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/app_config.dart';

class BasicLayout extends StatelessWidget {
  BasicLayout({
    Key key,
    @required this.child,
    this.designSize,
    this.allowFontScaling = false, // 是否缩放字体
  }) : super(key: key);
  final Widget child;
  final bool allowFontScaling;
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize ?? AppConfig.screenSize,
      allowFontScaling: allowFontScaling,
      child: child,
    );
  }
}
