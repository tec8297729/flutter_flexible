import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'TipsScaleAnimated.dart';

class DoubleBackExitApp extends StatefulWidget {
  /// 退出提示动画组件
  DoubleBackExitApp({this.title});

  /// 提示文字
  final String title;

  @override
  _DoubleBackExitAppState createState() => _DoubleBackExitAppState();
}

class _DoubleBackExitAppState extends State<DoubleBackExitApp>
    with SingleTickerProviderStateMixin {
  Animation<double> animation; // 动画对象
  AnimationController controller;
  DateTime _lastPressedAt; // 上次点击时间
  Timer _tipsTimer;

  @override
  void initState() {
    super.initState();
    // 动画对象
    controller = AnimationController(
      duration: Duration(milliseconds: 200), // 动画持续时间
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
    return WillPopScope(
      // 监听返回事件
      onWillPop: this.handleWillPop,
      child: TipsScaleAnimated(
        animation: animation, // 传入动画效果的animation
        child: Text(
          widget.title ?? '再按一次退出',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // 验校几秒内二次返回键退出APP，默认2秒
  Future<bool> handleWillPop() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      this.runTips(); // 显示tips提示
      return false;
    }
    return true;
  }

  // 底部提示信息动画控制
  void runTips() {
    const oneSec = Duration(milliseconds: 1300); // tips文字显示时间
    _tipsTimer = null;

    controller.reset(); // 重置动画
    controller.forward(); // 开始动画

    // 间隔一秒后执行 隐藏
    _tipsTimer = Timer(oneSec, () {
      controller.reset();
    });
  }
}
