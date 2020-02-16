# flexible脚手架介绍
基础环境版本

• Flutter version 1.12.13+hotfix.8

• Dart version 2.7.0 

<br>
内置集成功能：

1、状态管理：集成Provider在Flutter项目中，任何页面声明好store，注入providers_config.dart文件内即可使用。

2、页面组件支持别名路由跳转传参（参数接收更短更便捷），无需任何插件支持！简单易用，无学习成本。
```
Navigator.pushNamed(
  context,
  '/testDemo',
  arguments: {'data': 'hello world'},
);

// 子组件使用及接收
class testDemo extends StatefulWidget {
  testDemo({Key key, this.params}) : super(key: key);
  final params;

  @override
  _testDemoState createState() => _testDemoState();
}
class _testDemoState extends State<testDemo>{
  @override
  void initState() {
    super.initState();
    print(widget.params); // 别名参数接收
  }
}
```

3、页面路由跳转容错处理，未声明路由跳转错误，指定跳转到错误页面。能让你第一时间发现低级错误bug，友好提示页面清晰明了。

4、内置全局主题一键换色，只需要配置你的主题颜色，调用方法即可。

5、内置全局浮动调试组件，让你在真机上也能便利的获取错误捕获，在我的页面》右下按钮 查看效果。


## 文件夹结构
这是项目中一直会使用的结构
    lib/
    |- constants/ # 常量文件夹
    |- config/ # 配置参数
    |- components/ # 共用widget组件封装
    |- provider/ # 全局状态
    |- pages/ # 页面ui层，每个独立完整的页面
    |- utils/ # 公共方法抽离
      |- dio/ # dio底层请求封装safeRequest
    |- service/ # 请求接口抽离层
    |- routes/
      |- routesInit.dart # 定义路由页面
    |- main.dart # 入口文件

<br/><br/>

# 快速上手

## 启动项目
下载此仓库文件后，进入项目目录文件夹

初始化安装依赖包以及启用APP（记的开启你的模拟器）
输入以下命令：
```
npm run initApp // 方式一

// 方式二：手动输入flutter命令
flutter pub get
flutter run
```
<br/>

----------

## 打包项目方式
你可以使用flutter原生命令，或是使用脚手架内置好的直接使用。

同时打包android和ios二个APP文件，输入以下命令：

```
npm run build
```

<br/>
单独打包某一个平台的文件命令如下：

```
npm run build:apk // 打包安卓的APK文件

npm run build:ios // 打包IOS的文件

npm run build:web // 打包web的文件
```

<br>

# 命令行参数说明

|       命令        |                         说明                         |
| :---------------: | :--------------------------------------------------: |
|     npm start     |       启动APP项目，请提前开好模拟器或连接真机        |
|   npm run build   |       打包项目生成APP，会打包安卓和IOS二个版本       |
| npm run build:apk |                打包生成安卓的APP文件                 |
| npm run build:ios |                 打包生成IOS的APP文件                 |
| npm run build:web |               打包生成纯前端web的文件                |
|   npm run upsdk   | 更新sdk版本，全局的flutter和dart版本将更新为最新版本 |

<br>

# 功能介绍
## 获取全局context
```dart
import 'package:flexible/ioc/locator.dart' show locator, CommonService;
CommonService _commonIoc = locator.get<CommonService>();
_commonIoc.getGlobalContext; // 全局context对象
```

## dio请求底层封装使用
已经抽离请求组件dio，可直接使用
```
import 'package:flexible/utils/dio/safeRequest.dart';
// get请求使用方法，同dio组件request方法
getHomeData() async {
  Map resData = await safeRequest(
    'http://url',
    queryParameters: {'version': version},
    options: Options(method: 'GET'),
  );
}
// post请求
getHomeData() async {
  Map resData = await safeRequest(
    'http://url',
    data: {'version': version}, // 传递参数
    options: Options(method: 'POST'),
  );
}
```


## APP版本更新
1、添加安卓的存储权限申请标签(默认已添加, 可跳过此步)，如有删除安卓目录生成过的，请自行添加一下。

安卓权限配置文件 android\app\src\main\AndroidManifest.xml
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.flutter_flexible">
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <application>...其它配置忽略</application>
</manifest>
```

2、在lib\components\UpdateAppVersion\getNewAppVer.dart文件中，getNewAppVer方法直接运行更新APP版本，但有少部份需要自己实现，已标注TODO位置，指定APP下载地址和获取新版本的接口替换。
```dart
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
    androidUrl:
        'https://b6.market.xiaomi.com/download/AppStore/08fee50a2945783f419a5945f8e89707f2640c6b0/com.ss.android.ugc.aweme.apk',
  ),
)
```

3、在指定页面运行 检查APP版本函数，默认在lib\pages\HomeBarTabs\HomeBarTabs.dart中，运行检查更新APP函数，你可以指定其它位置运行检查新版本。

```dart
import 'package:flexible/components/UpdateAppVersion/UpdateAppVersion.dart' show getNewAppVer;

getNewAppVer(); // 执行更新检查
```

## 埋点功能
在lib\ioc\services\analytics_service.dart文件中添加埋点统计代码即可，已标注TODO位置。

闪屏页面需要手动添加统计，其它常规页面都可统计到，无需手动埋点。


