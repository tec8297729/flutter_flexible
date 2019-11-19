import 'package:flexible/stores/themeStore/themeStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flexible/constants/themes/themePink.dart';
import 'package:flexible/constants/themes/themeBlueGrey.dart';
import 'package:flexible/constants/themes/themeLightBlue.dart';

class MyPersonal extends StatefulWidget {
  @override
  _MyPersonalState createState() => _MyPersonalState();
}

class _MyPersonalState extends State<MyPersonal> {
  ThemeStore _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Provider.of<ThemeStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyPersonal页面'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '全局主题色切换',
              style: TextStyle(fontSize: 30),
            ),
            RaisedButton(
              child: Text(
                '切换粉色主题',
                style: TextStyle(fontSize: 22, color: Colors.white70),
              ),
              color: Colors.pink,
              onPressed: () {
                switchTheme(themePink);
              },
            ),
            RaisedButton(
              child: Text(
                '切换蓝灰主题',
                style: TextStyle(fontSize: 22, color: Colors.white70),
              ),
              color: Colors.blueGrey,
              onPressed: () {
                switchTheme(themeBlueGrey);
              },
            ),
            RaisedButton(
              child: Text(
                '切换天空蓝主题',
                style: TextStyle(fontSize: 22, color: Colors.white70),
              ),
              color: Colors.lightBlue,
              onPressed: () {
                switchTheme(themeLightBlue);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.import_contacts),
      ), //
    );
  }

  switchTheme(ThemeData themeData) {
    _theme.setTheme(themeData);
  }
}
