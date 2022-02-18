import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/app_main/home/provider/counterStore.p.dart';
import 'provider/global.p.dart';
import 'provider/theme_store.p.dart';

List<SingleChildWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>(create: (_) => ThemeStore()),
  ChangeNotifierProvider<GlobalStore>(create: (_) => GlobalStore()),
  ChangeNotifierProvider<CounterStore>(create: (_) => CounterStore()),
];
