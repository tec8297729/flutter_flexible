import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../routes/routeName.dart';

class HeadUserBox extends StatefulWidget {
  @override
  _HeadUserBoxState createState() => _HeadUserBoxState();
}

class _HeadUserBoxState extends State<HeadUserBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        btnWidget(
          title: "登入",
          onTap: () {
            // Navigator.pushNamed(context, RouteName.login);
          },
        ),
        btnWidget(
          title: "注册",
          onTap: () {
            // Navigator.pushNamed(context, RouteName.register);
          },
        ),
      ],
    );
  }

  Widget baseBox({Widget child}) {
    final double interval = 20;
    return Container(
      alignment: Alignment.center,
      height: 130,
      margin: EdgeInsets.fromLTRB(interval, 0, interval, 0),
      child: child,
    );
  }

  Widget btnWidget({String title, VoidCallback onTap}) {
    return baseBox(
      child: RaisedButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: 33.sp),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
