import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/onGenerateRoute.dart';
import 'routes/routesInit.dart'; // 路由配置
import 'stores/counterStore/counterStore.dart'; // mobx共享的数据类

void main() {
  runApp(MultiProvider(
    providers: [
      // 每一个共享的store类...
      Provider<CounterStore>(builder: (_) => CounterStore()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: initialRoute,
      // 全局统一获取路由传递的参数
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
