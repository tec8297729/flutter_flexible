import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/themeStore.p.dart';
import '../../../../constants/themes/index_theme.dart';
import '../../provider/appHomePageStore.p.dart';

class SetThemeDemo extends StatefulWidget {
  @override
  _SetThemeDemoState createState() => _SetThemeDemoState();
}

class _SetThemeDemoState extends State<SetThemeDemo> {
  ThemeStore _theme;
  AppHomePageStore appPageStore;

  @override
  Widget build(BuildContext context) {
    _theme = Provider.of<ThemeStore>(context);
    appPageStore = Provider.of<AppHomePageStore>(context);

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('全局主题色切换', style: TextStyle(fontSize: 30)),
          btnWidget('切换粉色主题', themePink, Colors.pink),
          btnWidget('切换蓝灰主题', themeBlueGrey, Colors.blueGrey),
          btnWidget('切换天空蓝主题', themeLightBlue, Colors.lightBlue),
          btnWidget('暗模式', ThemeData.dark(), ThemeData.dark().backgroundColor),
          grayBtn(),
        ],
      ),
    );
  }

  /// 灰度按钮
  Widget grayBtn() {
    return RaisedButton(
      child: Text(
        '灰度模式--${appPageStore.getGrayTheme ? "开启" : "关闭"}',
        style: TextStyle(fontSize: 22),
      ),
      onPressed: () {
        appPageStore.setGrayTheme(!appPageStore.getGrayTheme);
      },
    );
  }

  Widget btnWidget(String title, ThemeData themeData, Color color) {
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
