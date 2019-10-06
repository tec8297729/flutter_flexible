import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search页面'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.green,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('搜索内容'),
          ],
        ),
      ),
    );
  }
}
