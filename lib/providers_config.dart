import 'package:provider/provider.dart';
import 'pages/Home/provider/counterStore.p.dart';
import 'pages/HomeBarTabs/provider/homeBarTabsStore.p.dart';
import 'provider/themeStore.p.dart';

List<SingleChildCloneableWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()), // 主题颜色
  ChangeNotifierProvider<HomeBarTabsStore>.value(value: HomeBarTabsStore()),
  ChangeNotifierProvider<CounterStore>.value(value: CounterStore()),
];
