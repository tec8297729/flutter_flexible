import 'package:flutter/material.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Center(
          child: CircularProgressIndicator(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(text ?? '加载中...'),
        ),
      ],
    );
  }
}
