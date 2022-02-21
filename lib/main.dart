import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:jh_debug/jh_debug.dart' show DebugMode, jhDebug, jhDebugMain;
import 'routes/generate_route.dart' show generateRoute;
import 'routes/routes_data.dart'; // 路由配置
import 'providers_config.dart' show providersConfig; // providers配置文件
import 'provider/theme_store.p.dart'; // 全局主题
import 'config/common_config.dart' show commonConfig;
import 'package:ana_page_loop/ana_page_loop.dart' show anaAllObs;
import 'utils/app_setup/index.dart' show appSetupInit;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  jhDebugMain(
    appChild: MultiProvider(
      providers: providersConfig,
      child: const MyApp(),
    ),
    debugMode: DebugMode.inConsole,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    jhDebug.setGlobalKey = commonConfig.getGlobalKey;
    appSetupInit();
    return Consumer<ThemeStore>(
      builder: (context, themeStore, child) {
        return MaterialApp(
          navigatorKey: jhDebug.getNavigatorKey,
          showPerformanceOverlay: false,
          locale: const Locale('zh', 'CH'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US'),
          ],
          theme: themeStore.getTheme,
          initialRoute: initialRoute,
          onGenerateRoute: generateRoute, // 路由处理
          debugShowCheckedModeBanner: false,
          navigatorObservers: [...anaAllObs()],
        );
      },
    );
  }
}
