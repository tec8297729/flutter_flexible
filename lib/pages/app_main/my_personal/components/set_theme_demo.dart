import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/theme_store.p.dart';
import '../../../../constants/themes/index_theme.dart';
import '../../../../provider/global.p.dart';

class SetThemeDemo extends StatefulWidget {
  @override
  State<SetThemeDemo> createState() => _SetThemeDemoState();
}

class _SetThemeDemoState extends State<SetThemeDemo> {
  late ThemeStore _theme;
  late GlobalStore appPageStore;

  @override
  Widget build(BuildContext context) {
    _theme = Provider.of<ThemeStore>(context);
    appPageStore = Provider.of<GlobalStore>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: <Widget>[
            const Text('全局主题色切换', style: TextStyle(fontSize: 30)),
            btnWidget('切换粉色主题', themePink, Colors.pink),
            btnWidget('切换蓝灰主题', themeBlueGrey, Colors.blueGrey),
            btnWidget('切换天空蓝主题', themeLightBlue, Colors.lightBlue),
            btnWidget('暗模式', ThemeData.dark(),
                ThemeData.dark().colorScheme.background),
            grayBtn(),
          ],
        ),
      ],
    );
  }

  /// 灰度按钮
  Widget grayBtn() {
    return ElevatedButton(
      child: Text(
        '灰度模式--${appPageStore.getGrayTheme ? "开启" : "关闭"}',
        style: const TextStyle(fontSize: 22),
      ),
      onPressed: () {
        appPageStore.setGrayTheme(!appPageStore.getGrayTheme);
      },
    );
  }

  Widget btnWidget(String title, ThemeData themeData, Color color) {
    return ElevatedButton(
      onPressed: () {
        _theme.setTheme(themeData);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, color: Colors.white70),
      ),
    );
  }
}
