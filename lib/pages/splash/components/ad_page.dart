import 'package:flutter/material.dart';
import 'dart:async';
import '../../../routes/route_name.dart';

/// APP入口全屏广告页面
class AdPage extends StatefulWidget {
  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  String _info = '';
  late Timer? _timer;
  int timeCount = 3;

  @override
  void initState() {
    _initSplash();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// App广告页逻辑。
  void _initSplash() {
    const timeDur = Duration(seconds: 1); // 1秒

    _timer = Timer.periodic(timeDur, (Timer t) {
      setState(() {
        _info = "广告页，$timeCount 秒后跳转到主页";
      });
      if (timeCount <= 0) {
        _timer?.cancel();
        Navigator.pushReplacementNamed(context, RouteName.appMain);
        return;
      }
      timeCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(_info),
          ),
          flotSkipWidget(),
        ],
      ),
    );
  }

  Widget flotSkipWidget() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 20,
      right: 20,
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, RouteName.appMain);
        },
        child: Container(
          alignment: Alignment.center,
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 2.0),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: const Text('跳过', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
