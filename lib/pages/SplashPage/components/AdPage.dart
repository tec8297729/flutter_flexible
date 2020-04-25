import 'package:flutter/material.dart';
import 'dart:async';
import '../../../routes/routeName.dart';

/// APP入口全屏广告页面
class AdPage extends StatefulWidget {
  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  String _info = '';
  Timer _timer;
  int timeCount;

  @override
  void initState() {
    super.initState();
    timeCount = 3; // 倒计时总时间
    _initSplash();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  /// App广告页逻辑。
  void _initSplash() {
    const timeDur = Duration(seconds: 1); // 1秒

    _timer = Timer.periodic(timeDur, (Timer t) {
      if (timeCount <= 0) {
        Navigator.of(context).pushReplacementNamed(RouteName.appHomePage);
        return;
      }
      setState(() {
        timeCount--;
        _info = "广告页，$timeCount 秒后跳转到主页";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Text("$_info"),
        ),
        flotSkipWidget(),
      ],
    );
  }

  flotSkipWidget() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 20,
      right: 20,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(RouteName.appHomePage);
        },
        child: Container(
          alignment: Alignment.center,
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 2.0),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Text('跳过', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
