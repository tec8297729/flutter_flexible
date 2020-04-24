import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/AppHomePage/Home/provider/counterStore.p.dart';
import 'pages/AppHomePage/provider/appHomePageStore.p.dart';
import 'provider/themeStore.p.dart';

List<SingleChildWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()), // 主题颜色
  ChangeNotifierProvider<AppHomePageStore>.value(value: AppHomePageStore()),
  ChangeNotifierProvider<CounterStore>.value(value: CounterStore()),
];
