import 'package:flutter/material.dart';

class TipsScaleAnimated extends AnimatedWidget {
  const TipsScaleAnimated(
      {super.key, required this.animation, required this.child})
      : super(listenable: animation);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation, // 定义动画效果
      child: PhysicalModel(
        color: Colors.transparent, // 设置背景颜色
        borderRadius: BorderRadius.circular(15), // 定义裁剪圆度
        clipBehavior: Clip.antiAlias, // 常规，使用什么方式剪裁
        child: Container(
          padding:
              const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 14, right: 14),
          color: const Color.fromRGBO(0, 0, 0, 0.6),
          child: child,
        ),
      ),
      // 指定动画效果
      builder: (context, child) {
        return Transform.scale(
          origin: const Offset(0, 50), // 缩放后的偏移x,y位置
          scale: animation.value,
          alignment: Alignment.center, // 缩放后的相对定位位置
          child: child,
        );
      },
    );
  }
}
