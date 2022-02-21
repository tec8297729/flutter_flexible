import 'package:flutter/material.dart';

// 错误页面
class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key, this.params, this.title, this.errorText})
      : super(key: key);
  final dynamic params;

  /// 页面标题
  final String? title;

  /// 页面内容
  final String? errorText;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Error'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Icon(Icons.error, color: Colors.red, size: 66),
            ),
            SelectableText(
              widget.errorText ?? '错误：未定义的路由',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
