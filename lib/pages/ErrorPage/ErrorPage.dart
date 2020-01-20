import 'package:flutter/material.dart';

// 错误页面
class ErrorPage extends StatefulWidget {
  ErrorPage({Key key, this.params, this.title, this.errorText})
      : super(key: key);
  final params;

  /// 页面标题
  final String title;

  /// 页面内容
  final String errorText;

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
        title: Text(widget.title ?? 'Error'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(Icons.error, color: Colors.red, size: 66),
            ),
            SelectableText(
              widget.errorText ?? '错误：未定义的路由',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
