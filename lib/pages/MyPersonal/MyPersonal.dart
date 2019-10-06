import 'package:flutter/material.dart';

class MyPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPersonal页面'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.orange,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('我的内容'),
          ],
        ),
      ),
    );
  }
}
