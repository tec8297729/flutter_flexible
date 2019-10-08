import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'routes/onGenerateRoute.dart';
import 'routes/routesInit.dart'; // 路由配置
import 'stores/counterStore/counterStore.dart'; // mobx共享的数据类
import 'stores/themeStore/themeStore.dart'; // 全局主题

void main() {
  runApp(MultiProvider(
    providers: [
      // 每一个共享的store类...
      Provider<ThemeStore>.value(value: ThemeStore()),
      Provider<CounterStore>(builder: (_) => CounterStore()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeStore>(context);
    return Observer(
      name: 'theme', // 定义观察者名称
      builder: (_) => MaterialApp(
        theme: theme.getTheme,
        initialRoute: initialRoute,
        // 全局统一获取路由传递的参数
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
