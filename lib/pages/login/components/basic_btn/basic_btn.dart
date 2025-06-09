import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicBtn extends StatelessWidget {
  const BasicBtn({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
    this.highlightColor,
  });

  /// 点击事件
  final void Function()? onPressed;

  /// 文本内容
  final String title;

  /// 背景色
  final Color? color;

  /// 移入背景色
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.w),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(44),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(fontSize: 32.sp),
        ),
      ),
    );
  }
}
