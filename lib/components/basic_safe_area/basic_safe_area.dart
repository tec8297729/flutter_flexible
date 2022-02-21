import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 基础白页组件，带顶部X
class BasicSafeArea extends StatefulWidget {
  const BasicSafeArea({
    Key? key,
    this.children,
    this.closeFn,
    this.isShowRightChild = true,
    this.rightText,
    this.rightChildFn,
  }) : super(key: key);

  /// 内容组件N个
  final List<Widget>? children;

  /// 顶部左侧icon事件
  final VoidCallback? closeFn;

  /// 顶部右侧icon事件
  final VoidCallback? rightChildFn;

  /// 是否显示右侧组件
  final bool isShowRightChild;

  /// 右侧icon文字
  final String? rightText;

  @override
  _BasicSafeAreaState createState() => _BasicSafeAreaState();
}

class _BasicSafeAreaState extends State<BasicSafeArea> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ...?widget.children,
          closeIcon(),
          headerRight(),
        ],
      ),
    );
  }

  /// 关闭icon组件
  Widget closeIcon() {
    return Positioned(
      top: 10.w,
      left: 15.w,
      child: InkWell(
        onTap: () {
          if (widget.closeFn != null) {
            return widget.closeFn!();
          }
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close,
          size: 52.sp,
        ),
      ),
    );
  }

  /// 右侧顶部组件
  Widget headerRight() {
    if (widget.isShowRightChild) {
      return Positioned(
        top: 10.w,
        right: 20.w,
        child: InkWell(
          onTap: widget.rightChildFn,
          child: Text(
            widget.rightText ?? '',
            style: TextStyle(fontSize: 36.sp),
          ),
        ),
      );
    }
    return Container();
  }
}
