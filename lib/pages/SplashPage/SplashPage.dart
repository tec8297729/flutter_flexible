import 'package:flutter/services.dart';

import 'components/AdPage.dart';
import 'components/WelcomePage.dart';
import '../../config/app_config.dart';
import '../../utils/sp_util.dart';
import 'package:flutter/material.dart';

/// 闪屏页。
class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Widget child;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _initAsync();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  _initAsync() async {
    await SpUtil.getInstance();
    setState(() {
      /// 是否显示引导页。
      if (SpUtil.getData<bool>("key_guide", defValue: true)) {
        SpUtil.setData("key_guide", false);
        child = WelcomePage();
      } else {
        child = AdPage();
      }
    });

    /// 调试阶段，直接跳过此组件
    if (AppConfig.notSplash) {
      Navigator.of(context).pushReplacementNamed(AppConfig.directPageName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      resizeToAvoidBottomInset: false,
    );
  }
}
