import 'package:flutter/material.dart';

/// 指引页面
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _info = '';

  @override
  void initState() {
    super.initState();
    _initBanner();
  }

  /// App引导页逻辑。
  void _initBanner() async {
    setState(() {
      _info = "引导页～";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("$_info"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'welcomBtn',
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
      ),
    );
  }
}
