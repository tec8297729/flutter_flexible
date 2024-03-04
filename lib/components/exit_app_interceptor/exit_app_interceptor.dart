import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tips_scale_animated.dart';

/// 二次返回退出APP组件
class ExitAppInterceptor extends StatefulWidget {
  /// 退出提示动画组件
  const ExitAppInterceptor({this.title});

  /// 提示文字
  final String? title;

  @override
  State<ExitAppInterceptor> createState() => _DoubleBackExitAppState();
}

class _DoubleBackExitAppState extends State<ExitAppInterceptor>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation; // 动画对象
  late AnimationController controller;
  DateTime? _lastPressedAt; // 上次点击时间
  late Timer? _tipsTimer;

  @override
  void initState() {
    super.initState();
    // 动画对象
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    // 定义开始到结束的值
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    _tipsTimer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // 监听返回事件
      onPopInvoked: handleWillPop,
      child: TipsScaleAnimated(
        animation: animation,
        child: Text(
          widget.title ?? '再按一次退出',
          style: TextStyle(
            fontSize: 28.sp,
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // 验校几秒内二次返回键退出APP，默认2秒
  handleWillPop(bool didPop) {
    if (didPop) return;
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) >
            const Duration(seconds: 2)) {
      // 两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      runTips();
      return;
    }
    exit(0);
  }

  // 底部提示信息动画控制
  void runTips() {
    const oneSec = Duration(milliseconds: 1300);
    _tipsTimer = null;

    controller.reset(); // 重置动画
    controller.forward(); // 开始动画

    // 间隔一秒后执行 隐藏
    _tipsTimer = Timer(oneSec, () {
      controller.reset();
    });
  }
}
