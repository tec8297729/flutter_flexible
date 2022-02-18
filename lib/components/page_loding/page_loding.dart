import 'package:flutter/material.dart';

class PageLoading extends StatelessWidget {
  PageLoading({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(text ?? '加载中...'),
        ),
      ],
    );
  }
}
