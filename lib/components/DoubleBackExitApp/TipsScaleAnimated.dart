import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsScaleAnimated extends AnimatedWidget {
  // 传入animation动画对象给 继承类中的listenable属性(代表监听此对象)
  TipsScaleAnimated(
      {Key key, Animation<double> animation, @required this.child})
      : super(key: key, listenable: animation);

  final child;

  Widget build(BuildContext context) {
    final Animation<double> _animation = listenable; // 获取动画监听对象animation

    return AnimatedBuilder(
      animation: _animation, // 定义动画效果
      child: PhysicalModel(
        color: Colors.transparent, // 设置背景颜色
        borderRadius: BorderRadius.circular(15), // 定义裁剪圆度
        clipBehavior: Clip.antiAlias, // 常规，使用什么方式剪裁
        child: Container(
          padding: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 14, right: 14),
          color: Color.fromRGBO(0, 0, 0, 0.6),
          child: child,
        ),
      ),
      // 指定动画效果
      builder: (BuildContext context, Widget child) {
        return Transform.scale(
          origin: Offset(0, 50), // 缩放后的偏移x,y位置
          scale: _animation.value,
          alignment: Alignment.center, // 缩放后的相对定位位置
          child: child,
        );
      },
    );
  }
}
