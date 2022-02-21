import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/app_config.dart';

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
      builder: () {
        return child;
      },
    );
  }
}
