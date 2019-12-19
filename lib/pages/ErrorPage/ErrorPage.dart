import 'package:flutter/material.dart';

// 错误页面
class ErrorPage extends StatefulWidget {
  ErrorPage({Key key, this.params}) : super(key: key);
  final params;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState() {
    super.initState();
    print('路由接收参数》》${widget.params['data']}');
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
            '错误：未定义的路由，请跳转到已声明路由',
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
