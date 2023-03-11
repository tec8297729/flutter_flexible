import 'package:flutter/material.dart';
import 'components/set_theme_demo.dart';
import 'package:jh_debug/jh_debug.dart';

import 'components/head_userbox.dart';

class MyPersonal extends StatefulWidget {
  @override
  State<MyPersonal> createState() => _MyPersonalState();
}

class _MyPersonalState extends State<MyPersonal>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPersonal页面'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          HeadUserBox(),
          SetThemeDemo(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'myPerBtn1',
        onPressed: () {
          jhDebug.showDebugBtn(); // 全局显示调试按钮
        },
        tooltip: '显示全局浮动调试按钮',
        child: const Icon(Icons.bug_report),
      ), //
    );
  }
}
