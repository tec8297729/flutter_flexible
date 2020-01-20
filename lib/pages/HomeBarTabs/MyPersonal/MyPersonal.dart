import 'package:flutter/material.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:provider/provider.dart';
import '../../../provider/themeStore.p.dart';
import '../../../config/themes/index_theme.dart';

class MyPersonal extends StatefulWidget {
  @override
  _MyPersonalState createState() => _MyPersonalState();
}

class _MyPersonalState extends State<MyPersonal>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  ThemeStore _theme;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            Text('全局主题色切换', style: TextStyle(fontSize: 30)),
            btnWidget('切换粉色主题', themePink, Colors.pink),
            btnWidget('切换蓝灰主题', themeBlueGrey, Colors.blueGrey),
            btnWidget('切换天空蓝主题', themeLightBlue, Colors.lightBlue),
            btnWidget(
                '暗模式', ThemeData.dark(), ThemeData.dark().backgroundColor),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'myPerBtn1',
        onPressed: () {
          jhDebug.showDebugBtn(); // 全局显示调试按钮
        },
        tooltip: '显示全局浮动调试按钮',
        child: Icon(Icons.import_contacts),
      ), //
    );
  }

  btnWidget(String title, ThemeData themeData, Color color) {
    return RaisedButton(
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white70),
      ),
      color: color,
      onPressed: () {
        _theme.setTheme(themeData);
      },
    );
  }
}
