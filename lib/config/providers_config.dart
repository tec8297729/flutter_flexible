import 'package:provider/provider.dart';
import '../model/themeStore/themeStore.dart';
import 'package:flexible/pages/BarTabs/model/barTabsStore.dart';
import 'package:flexible/pages/Home/model/counterStore/counterStore.dart';

List<SingleChildCloneableWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()), // 主题颜色
  ChangeNotifierProvider<BarTabsStore>.value(value: BarTabsStore()),
  Provider<CounterStore>.value(value: CounterStore()),
];
