import 'package:flutter/material.dart';

// 错误页面
class ErrorPage extends StatefulWidget {
  ErrorPage({Key key, this.params, this.title}) : super(key: key);
  final params;
  final String title;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ErrorPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(
              Icons.error, // 图标
              color: Colors.red, // 颜色
              size: 66, // 大小
            ),
          ),
          Text(
            widget.title ?? '错误：未定义的路由',
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
