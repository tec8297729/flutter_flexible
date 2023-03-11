import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  /// 多选框按钮
  const CustomCheckbox({
    required this.value,
    this.size = 30,
    this.iconSize,
    this.radius = 5,
    this.unSelectedColor,
    this.selectedColor,
    @required this.onChanged,
    this.borderColor = Colors.grey,
  });

  /// 是否选中
  final bool value;

  /// 元素大小
  final double size;

  /// icon图标大小
  final double? iconSize;

  /// 圆角大小
  final double? radius;

  /// 未选中时背景色
  final Color? unSelectedColor;

  /// 选中时背景色
  final Color? selectedColor;

  /// 边框颜色
  final Color? borderColor;

  /// 点击事件
  final void Function(bool value)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  // box背景颜色
  Color checkBoxColor() {
    if (widget.value) {
      return widget.selectedColor ?? Colors.blue;
    }

    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged!(widget.value);
      },
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: checkBoxColor(),
          borderRadius: BorderRadius.circular(widget.radius!),
          border: widget.value
              ? null
              : Border.all(
                  width: 2,
                  color: widget.borderColor!,
                ),
        ),
        width: widget.size,
        height: widget.size,
        child: widget.value
            ? Icon(
                Icons.check,
                color: widget.unSelectedColor ?? Colors.white,
                size: widget.iconSize ?? (widget.size * 0.8),
              )
            : null,
      ),
    );
  }
}
