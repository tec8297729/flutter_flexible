import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/DyInput.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_userInput()],
      ),
    );
  }

  /// 帐号密码
  Widget _userInput() {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 0, 35, 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, 1),
            offset: Offset(0, 10),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          DyInput(
            controller: userController,
            hintText: '请输入手机号',
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[\u4e00-\u9fa5]')),
              FilteringTextInputFormatter.digitsOnly, // 0-9之间
              LengthLimitingTextInputFormatter(11),
            ],
            isNext: true,
          ),
          DyInput(
            controller: pwdController,
            hintText: '请输入密码',
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[\u4e00-\u9fa5]')),
              LengthLimitingTextInputFormatter(8),
            ],
            isInputPwd: true,
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
