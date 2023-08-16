import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../routes/route_name.dart';

class HeadUserBox extends StatefulWidget {
  @override
  State<HeadUserBox> createState() => _HeadUserBoxState();
}

class _HeadUserBoxState extends State<HeadUserBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        btnWidget(
          title: "登入/注册",
          onTap: () {
            Navigator.pushNamed(context, RouteName.login);
          },
        ),
      ],
    );
  }

  Widget baseBox({Widget? child}) {
    const double interval = 20;
    return Container(
      alignment: Alignment.center,
      height: 130,
      margin: const EdgeInsets.fromLTRB(interval, 0, interval, 0),
      child: child,
    );
  }

  Widget btnWidget({required String title, VoidCallback? onTap}) {
    return baseBox(
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 33.sp),
        ),
      ),
    );
  }
}
