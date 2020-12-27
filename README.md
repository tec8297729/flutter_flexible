# flexible脚手架介绍

最新测试基础环境版本<br>

``` 

• flutter 1.22.5
• dart 2.10.4
• node 14+ 稳定版
```

内置集成功能：

• 动态环境构建打包，挂载在app内部全局参数中，如请求接口动态前缀url，根据不同打包环境使用不同的接口域名。

• 状态管理：集成Provider在Flutter项目中，任何页面声明好store，注入lib/providers_config.dart文件内即可使用。

• 页面组件更便捷的接收 路由别名跳转传参，底层已处理无需任何插件支持！简单易用，无学习成本。

• 全局主题一键换色，只需要配置你的主题颜色，调用方法即可。

• 全局浮动调试组件，让你在真机上也能便利的获取错误捕获。

• 全局context对象，可在任意位置获取使用，例如在状态管理provider层内使用

• OTA更新app功能，内置一套ui界面，轻松配置OTA更新地址。

PS：其它更多功能介绍往下拉查看 功能介绍区文档，或自行体验探索。

## 目录

* [项目目录结构](#项目目录结构)
* [快速入门上手](#快速入门上手)
  + [创建项目](#创建项目)
  + [启动项目](#启动项目)
  + [指令参数介绍](#指令参数介绍)
* [功能介绍](#功能介绍)
  + [动态环境变量](#动态环境变量) 
  + [App启动屏](#app启动屏) 
  + [获取全局context](#获取全局context) 
  + [dio封装](#dio封装简化使用) 
  + [别名路由传参](#别名路由传参)
  + [OTA更新App版本](#ota更新app版本)
  + [全局主题切换功能](#全局主题切换功能)
  + [全局路由监听](#全局路由监听)

<br>

## 项目目录结构

``` bash
  asset/ # 静态资源
  lib/
  |- components/ # 共用widget组件
  |- config/ # 全局配置参数
      |- app_config.dart # APP相关配置，如反向代理、设计稿尺寸等
  |- constants/ # 常量文件夹
  |- provider/ # 全局状态管理
  |- pages/ # 页面ui层
      |- AppMain/ # APP主体页面
      |- SplashPage/ # APP闪屏页
  |- service/ # 请求接口抽离层
  |- models/ # 数据类型
  |- routes/ # 路由相关文件夹
  |- utils/ # 工具类
```

<br/><br/>

# 快速入门上手

## 创建项目

1、全局安装cli插件，确保你的电脑中有node环境。<br>

``` bash
npm i -g flib-cli // 全局安装插件

// 方式二：手动下载，但没有全局指令功能
git clone https://github.com/tec8297729/flutter_flexible.git
```

2、打开终端，输入以下指令创建项目

``` bash
flib updata // 更新下载模板
flib create  // 创建项目，根据提示步骤往下进行，都有默认参数可直接回车
```

<br>

cli相关指令介绍<br>

``` bash
flib create 创建一个flutter项目
flib updata 更新最新flutter模板
flib page <name> 创建一个页面组件
```

## 启动项目

进入项目目录文件夹，初始化安装依赖包以及启用APP（记的开启你的模拟器）<br>

输入以下命令：<br>

``` bash
flutter pub get
flutter run
```

<br/>

### 指令参数介绍

指令也是为了更方便记忆使用，你也可以使用原生flutter指令打包等<br>

集成在项目中的指令如下：<br>

|      命令      |                         说明                         |
| :------------: | :--------------------------------------------------: |
| npm run start  |       启动APP项目，请提前开好模拟器或连接真机        |
| npm run build  |           同时打包APP的安卓和IOS，prod环境           |
| apk-build:test |              打包安卓 test环境的APP文件              |
| apk-build:pre  |              打包安卓 pre环境的APP文件               |
| apk-build:prod |              打包安卓 prod环境的APP文件              |
| ios-build:test |              打包IOS test环境的APP文件               |
| ios-build:pre  |               打包IOS pre环境的APP文件               |
| ios-build:prod |              打包IOS prod环境的APP文件               |
| npm run upsdk  | 更新sdk版本，全局的flutter和dart版本将更新为最新版本 |
| npm run appkey |             验证打包后的安卓apk签名信息              |

<br><br><br>

# 功能介绍

## 动态环境变量

默认使用npm run dev或是npm run apk-build:test等内置语法，是设置好了环境变量参数的，直接运行指令即可。<br>

1、在文件下定义环境参数： lib/config/app_env.dart，例如定义环境变量baseUrl <br>

2、在其它组件页面中直接调用即可

``` dart
import 'config/app_env.dart' show appEnv;
appEnv.baseUrl // 获取当前环境的url
```

## App启动屏

App启动屏图片修改到指定路径中替换成自己的图片<br>

``` 

// 这是安卓启动屏图片路径，默认只添加了一个文件加，需要不同分别率在mipmap-**相应文件夹内添加
android\app\src\main\res\mipmap\splash_bg.png 

// 这是IOS启动屏图片路径，LaunchImage**.png都替换成自己的启动屏图片
ios\Runner\Assets.xcassets\LaunchImage.imageset\LaunchImage.png
```

PS：启动屏欢迎页及广告页面在flutter组件中定制功能，在lib\pages\SplashPage目录中修改

## 获取全局context

全局Key和全局context都存放在全局common_config.dart文件中。<br>

PS：你可以把一些全局的类都可以此中使用，从而实现页面更加方便管理<br>

``` dart
import 'config/common_config.dart' show commonConfig;
commonConfig.getGlobalKey;; // 全局context对象
```

<br>

## dio封装简化使用

已经dio请求底层封装，更简化使用<br>

``` dart
import 'package:flexible/utils/request.dart';
// get请求使用方法，同dio组件request方法
getHomeData() async {
  Map resData = await Request.get(
    'url',
    queryParameters: {'key': 'value'}, // 在url后追加参数?key=value
  );
}

// post请求
getHomeData() async {
  Map resData = await Request.post(
    'http://url',
    data: {'version': version}, // 传递参数
    queryParameters: {'key': 'value'}, // 在url后追加参数?key=value
  );
}
```

#### dio拦截处理

在 lib/utils/dio/interceptors 目录内，扩展请求拦截处理

``` dart
/*
 * header拦截器
 */
class HeaderInterceptors extends InterceptorsWrapper {
  // 请求拦截
  @override
  onRequest(RequestOptions options) async {
    options.connectTimeout = 15000;
    options.baseUrl = AppConfig.host;
    return options;
  }

  // 响应拦截
  @override
  onResponse(Response response) async {
    return response;
  }

  // 请求失败拦截
  @override
  onError(DioError err) async {}
}
```

<br>

## 别名路由传参

别名路由传递参数，在接收过程更便捷利与使用。<br>

1、进入路由配置文件routes/routesData.dart，加入别名传参支持。<br>

``` dart
// routesData.dart文件
import 'package:flutter/material.dart';
import '../pages/ErrorPage/ErrorPage.dart';
import '../pages/TestDemo/TestDemo.dart';

final Map<String, WidgetBuilder> routesData = {
  // 路由/testDemo 添加别名路由传参支持。
  '/testDemo': (BuildContext context, {params}) => TestDemo(params: params),
  // error路由不加入别名传参功能，
  '/error': (BuildContext context, {params}) => ErrorPage(),
};

```

<br>
2、在页面中使用别名跳转，直接使用原生别名跳转方法即可<br>

``` dart
// 某页面跳转
Navigator.pushNamed(
  context,
  '/testDemo',
  arguments: {'data': 'hello world'}, //　传递参数
);

```

<br>
3、在接收的子页面直接读取params参数变量即可。<br>

``` dart
// 子页面组件使用及接收
class testDemo extends StatefulWidget {
  testDemo({Key key, this.params}) : super(key: key);
  final params; // 别名传参接收变量

  @override
  _testDemoState createState() => _testDemoState();
}
class _testDemoState extends State<testDemo>{
  @override
  void initState() {
    super.initState();
    print(widget.params); // 路由别名参数
  }
}
```

<br>

## OTA更新App版本

1、添加安卓的存储权限申请标签(默认已添加, 可跳过此步)，如有删除安卓目录生成过的，请自行添加一下。<br>

安卓权限配置文件 android\app\src\main\AndroidManifest.xml<br>

``` xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.flutter_flexible">
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <application>...其它配置忽略</application>
</manifest>
```

2、在lib\components\UpdateAppVersion\getNewAppVer.dart文件中，getNewAppVer方法直接运行更新APP版本，但有少部份需要自己实现，已标注TODO位置，指定APP下载地址和获取新版本的接口替换。<br>

``` dart
// TODO:替换成自己的获取新版本APP的接口
Map resData = await getNewVersion();
// 模拟参数结构如下  {"code":"0","message":"success","data":{"version":"1.1.0","info":["修复bug提升性能","增加彩蛋有趣的功能页面","测试功能"]}}

UpdateAppVersion(
    // TODO: 传入新版本APP相关参数、版本号、更新内容、下载地址等
    version: resData['version'] ?? '', // 版本号
    info: (resData['info'] as List).cast<String>() ?? [], // 更新内容介绍
    // ios是苹果应用商店地址
    iosUrl: 'itms-apps://itunes.apple.com/cn/app/id414478124?mt=8',
    // 安卓APK下载地址
    androidUrl: 'https://www.jonhuu.com/download/aweme.apk',
  ),
)
```

3、在指定页面运行 检查APP版本函数，默认在lib\pages\AppMain\AppMain.dart中，运行检查更新APP函数，你可以指定其它位置运行检查新版本。<br>

``` dart
import 'package:flexible/components/UpdateAppVersion/UpdateAppVersion.dart' show getNewAppVer;

getNewAppVer(); // 在指定组件页面 执行更新检查
```

## 全局主题切换功能

目前有内置几个主题，轻松切换整体app颜色主题功能，只需专注配置app各个参数颜色

如果要自定义app主题，把配置参数文件放入lib\config\themes文件夹中，然后part到index_theme.dart文件中统一管理。<br>

案例如下：<br>

``` dart
import 'package:flutter/material.dart';
// 以下你配置的全局主题颜色参数
part 'themeBlueGrey.dart';
part 'themeLightBlue.dart';
part 'themePink.dart';

```

主题配色具体可以参考是关配色文件 themeBlueGrey.dart等。<br>

在需要替换主题的页面中调用如下：<br>

``` dart
import 'package:flexible/constants/themes/index_theme.dart' show themeBlueGrey; // 主题文件
import 'package:flexible/provider/themeStore.p.dart'; // 全局主题状态管理
ThemeStore _theme = Provider.of<ThemeStore>(context);
_theme.setTheme(themeBlueGrey); // 替换主题，注入主题配置即可
```

### 灰度主题

灰度主题只有app首页生效，针对特殊场景使用，此功能不需要单独配置主题文件，直接使用即可。<br>

``` dart
import './lib/provider/global.p.dart';
GlobalStore globalStore = Provider.of<GlobalStore>(context);
globalStore.setGrayTheme(true); // 设置灰度模式
```

## 全局路由监听

默认监听全局路由页面，只需要添加你的第三方统计埋点即可，如需要某页面tab监听还需要你手动继承类，并且实现相关方法。<br>

具体实现由ana_page_loop插件完成，详细插件文档》》 https://github.com/tec8297729/ana_page_loop <br>

1、先找到如下文件 lib\utils\myAppSetup\anaPageLoopInit.dart，配置第三方统计方法，如果想指定路由不监听处理事件，写入相关路由名称即可。<br>

``` dart
// 找到如下文件 lib\utils\myAppSetup\anaPageLoopInit.dart
void anaPageLoopInit() {
  anaPageLoop.init(
    beginPageFn: (name) {
      // TODO: 第三方埋点统计开始
    },
    endPageFn: (name) {
      // TODO: 第三方埋点统计结束
    },
    routeRegExp: ['/appMain'], // 过滤路由
    debug: false,
  );
}
```

如果你的项目很简单，此时你已经完整了全局埋点处理，只需要添加一下第三方埋点方法即可。<br>
要是你需要独立统计PageView或是Tab组件中页面的，接着往第二步操作。<br>

2、首先提供了二个mixin继承类使用，用在你需要独立统计的页面，并且记得把当前独立统计的页面路由过滤掉，例如/home页面是独立统计四个页面，所以需要过滤整体的/home路由。<br>

``` 

PageViewListenerMixin类：用于监听类PageView组件
TabViewListenerMixin类：用于监听类TabBar组件
```

演示在PageView组件中的使用如下：<br>

``` dart
// 当前路由页面名称是 /appMain
class _AppMainState extends State<AppMain> with PageViewListenerMixin {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  // 实现PageViewListenerMixin类上的方法
  @override
  PageViewMixinData initPageViewListener() {
    return PageViewMixinData(
      controller: pageController, // 传递PageController控制器
      tabsData: ['首页', '分类', '购物车', '我的中心'], // 自定义每个页面记录的名称
    );
  }

  // 调用如下几个生命周期
  @override
  void didPopNext() {
    super.didPopNext();
  }

  @override
  void didPop() {
    super.didPop();
  }

  @override
  void didPush() {
    super.didPush();
  }

  @override
  void didPushNext() {
    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController, // 控制器
        children: <Widget>[],
      ),
    );
  }
}
```
