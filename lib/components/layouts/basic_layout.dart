import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/app_config.dart' show AppConfig;

class BasicLayout extends StatelessWidget {
  const BasicLayout({
    Key? key,
    required this.child,
    this.designSize,
  }) : super(key: key);
  final Widget child;
  final Size? designSize;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize ?? AppConfig.screenSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return child;
      },
    );
  }
}
