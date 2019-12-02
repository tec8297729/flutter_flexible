import 'package:provider/provider.dart';
import 'package:flexible/model/themeStore/themeStore.dart'; // 主题颜色
import 'package:flexible/pages/Home/model/counterStore/counterStore.dart';

List<SingleChildCloneableWidget> providers = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()),
  Provider<CounterStore>.value(value: CounterStore()),
];
