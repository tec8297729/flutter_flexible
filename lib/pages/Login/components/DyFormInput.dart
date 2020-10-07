import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flexible/components/CustomIcons/eyeIcon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 输入框组件
class DyInput extends StatefulWidget {
  DyInput({
    @required this.controller,
    this.hintText,
    this.inputFormatters,
    this.autofocus: false,
    this.isInputPwd: false,
    this.onChanged,
    this.keyboardType: TextInputType.text,
    this.isNext: false,
    this.onEditingComplete,
    this.maxLength,
  });

  /// 输入框提示内容
  final String hintText;

  /// 组件控制器
  final TextEditingController controller;

  /// 输入限制条件
  final List<TextInputFormatter> inputFormatters;

  /// 是否自动聚集
  final bool autofocus;

  /// 是否密码输入框
  final bool isInputPwd;

  /// 输入框内容改变事件
  final Function(String text) onChanged;

  /// 键盘回车确认事件
  final VoidCallback onEditingComplete;

  /// 键盘类型
  final TextInputType keyboardType;

  /// 键盘回车是否移动光标下一个
  final bool isNext;

  /// 最大限制
  final int maxLength;
  @override
  _DyInputState createState() => _DyInputState();
}

class _DyInputState extends State<DyInput> {
  bool showPwd = false;
  bool isShowClose = false;
  final FocusNode _focusNode = FocusNode(); // 获取输入框焦点

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isShowClose = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[100])),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.isNext ? TextInputAction.next : null,
        obscureText: widget.isInputPwd ? !showPwd : false, // 是否密码状态
        keyboardType: widget.keyboardType, // 键盘类型
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: InputBorder.none, // 清除内置边框
          contentPadding: EdgeInsets.all(8.0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green[400]),
          ),
          suffixIcon: _inputRightIcon(), // 右组件
        ),
        // 输入框内容改变时触发，获取当前用户正在输入的内容
        onChanged: widget.onChanged,
        // 点击键盘确认键时触发，
        onEditingComplete: () {
          if (widget.onEditingComplete != null) {
            widget.onEditingComplete();
          }
          widget.isNext ? _focusNode.nextFocus() : _focusNode.unfocus();
        },
        // 输入框文字样式
        style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(34)),
      ),
    );
  }

  /// 右侧组件
  Widget _inputRightIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 清空按钮
        if (isShowClose) closeIconWidget(),
        // 密码是否可见
        if (widget.isInputPwd) inputPwdWidget(),
      ],
    );
  }

  // 关闭icon组件
  Widget closeIconWidget() {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => widget.controller.clear());
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Icon(Icons.close),
      ),
    );
  }

  // 密码icon组件
  Widget inputPwdWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showPwd = !showPwd;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Icon(showPwd ? EyeIcon.eye : EyeIcon.eye_slash),
      ),
    );
  }
}
