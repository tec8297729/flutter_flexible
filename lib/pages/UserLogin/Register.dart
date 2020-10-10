import 'package:flutter/material.dart';
import '../../components/BasicSafeArea/BasicSafeArea.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routes/routeName.dart';
import '../../utils/index.dart';

/// 注册页面
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  /// 登录验证
  void onLogin() {
    if (userController.text.length > 6 && pwdController.text.length > 6) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.appHomePage,
        (router) => false,
      );
      return;
    }
    toastTips('提示：登入失败，帐号或密码错误');
  }

  /// 注册按钮
  void goLogin() {
    Navigator.pushNamed(context, RouteName.login);
  }

  void closeFn() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.appHomePage,
      (router) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BasicSafeArea(
        rightText: '立即登入',
        rightChildFn: goLogin,
        closeFn: closeFn,
        children: [
          Container(
            margin: EdgeInsets.only(top: 260.h),
            child: Column(
              children: [
                bottomBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loginBtn(),
      ],
    );
  }

  /// 登录按钮
  Widget loginBtn() {
    return InkWell(
      onTap: onLogin,
      child: Container(
        alignment: Alignment.center,
        height: 90.w,
        width: 620.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(143, 158, 251, 1),
            Color.fromRGBO(143, 158, 251, .6),
          ]),
        ),
        child: Text(
          '登入',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 40.sp,
            letterSpacing: 12,
          ),
        ),
      ),
    );
  }
}
