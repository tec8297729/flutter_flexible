import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 输出框风格类型
enum InputType {
  /// 普通类型
  normal,

  close,

  /// 验证码
  captcha,

  /// 自定义
  custom,
}

class CustomInput extends StatefulWidget {
  const CustomInput({
    Key? key,
    this.controller,
    this.inputFormatters,
    this.hintText,
    this.autofocus = false,
    this.onChanged,
    this.rightCustom,
    this.keyboardType,
    this.inputType = InputType.normal,
    this.margin,
    this.onTapCaptcha,
  }) : super(key: key);

  /// 文本controller类，如果传入需要手动销毁
  final TextEditingController? controller;

  /// 输入框类型
  final InputType inputType;

  /// 提示内容
  final String? hintText;

  /// 验证规则
  final List<TextInputFormatter>? inputFormatters;

  /// 是否自动聚集光标
  final bool? autofocus;

  /// 右侧自定义组件
  final Widget? rightCustom;

  /// 验证码点击事件
  final Future<bool> Function(int value)? onTapCaptcha;

  /// 输入框内容改变后事件
  final void Function(String value)? onChanged;

  /// 键盘弹起类型，默认纯数字
  final TextInputType? keyboardType;

  /// 外层边距距离
  final EdgeInsetsGeometry? margin;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  TextEditingController? _controller;
  double baseTextSize = 32.sp;
  Color desTextColor = const Color(0xFFB4B9C6);
  String captchaText = '获取验证码';
  bool changeFlag = false; // 是否正在变动中
  Timer? _timer; // 定时对象
  final FocusNode _focusNode = FocusNode(); // 光标
  bool isFocus = false; // 是否聚集

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        isFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) _timer?.cancel();
    if (widget.controller == null) _controller?.dispose();
    super.dispose();
  }

  // 动态验证
  List<TextInputFormatter> dyFormatters() {
    List<TextInputFormatter> formmatterList = [];
    switch (widget.inputType) {
      case InputType.captcha:
        formmatterList.addAll([
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ]);
        break;
      default:
        formmatterList.addAll([
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(11), // 限制长度
        ]);
    }
    return formmatterList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.w),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F9),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Stack(
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: widget.autofocus!,
            keyboardType: widget.keyboardType, // 默认键盘类型
            inputFormatters: widget.inputFormatters ?? dyFormatters(),
            decoration: InputDecoration(
              hintText: widget.hintText ?? '',
              hintStyle: TextStyle(
                fontSize: baseTextSize,
                color: desTextColor,
              ),
              // 底部边框线
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
          ),
          // 右侧扩展区
          rightFixedWidget(),
        ],
      ),
    );
  }

  // 右侧固定组件
  Widget rightFixedWidget() {
    Widget fixedChild = Container();
    switch (widget.inputType) {
      case InputType.captcha:
        fixedChild = Positioned(
          right: 0,
          top: 14,
          child: GestureDetector(
            onTap: onTapCaptcha,
            child: Text(
              captchaText,
              style: TextStyle(
                // 是否灰色
                color: changeFlag ? const Color(0xFFC4C7CD) : Colors.blue,
                fontSize: baseTextSize,
              ),
            ),
          ),
        );
        break;
      // 关闭icon组件，聚集时显示
      case InputType.close:
        if (isFocus) {
          fixedChild = Positioned(
            right: 0,
            top: 15,
            child: GestureDetector(
              onTap: () {
                _controller?.clear();
              },
              child: Icon(Icons.close, size: 36.sp),
            ),
          );
        }
        break;
      default:
    }
    return fixedChild;
  }

  // 验证码事件
  void onTapCaptcha() async {
    if (changeFlag) return;
    int seconds = 59;
    if (widget.onTapCaptcha != null) {
      bool flag = await widget.onTapCaptcha!(seconds);
      // 外层控制是否执行
      if (flag) return;
    }
    setState(() {
      changeFlag = true;
      captchaText = '重新发送 ${seconds}s';
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds--;
      setState(() {
        captchaText = '重新发送 ${seconds}s';
      });
      // 结束
      if (seconds <= 0) {
        timer.cancel();
        setState(() {
          changeFlag = false;
          captchaText = '获取验证码';
        });
      }
    });
  }
}
