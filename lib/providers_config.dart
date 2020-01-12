import 'package:provider/provider.dart';
import 'model/themeStore/themeStore.dart';
import 'pages/HomeBarTabs/model/HomeBarTabsStore.dart';
import 'pages/Home/model/counterStore/counterStore.dart';

List<SingleChildCloneableWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()), // 主题颜色
  ChangeNotifierProvider<HomeBarTabsStore>.value(value: HomeBarTabsStore()),
  Provider<CounterStore>.value(value: CounterStore()),
];
