# flexible脚手架介绍

无需任何复杂繁琐初期配置，让你更加专注与UI层。

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

4、内置全局主题一键换色

5、内置全局浮动调试组件，让你在真机上也能便利的获取错误捕获，在我的页面》右下按钮 查看效果




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

<br/>
<br/>

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

## dio请求底层封装使用
已经抽离请求组件dio，可直接使用
```
import 'package:flexible/utils/dio/safeRequest.dart';
// 请求组件使用，同dio组件request方法
getHomeData() async {
  Map resData = await safeRequest(
    'http://url',
    queryParameters: {'version': version},
    options: Options(method: 'GET'),
  );
}
```

## 更换启动图
#### 安卓启动图

在目录 android\app\src\main\res\mipmap-** 内，有好几个分别率目录，每个目录内的splash_bg.png文件替换成你自己的启动图片

<!-- #### ios启动图

在目录ios\Runner\Assets.xcassets\LaunchImage.imageset 内，把LaunchImage.png、LaunchImage@2x.png、LaunchImage@3x.png 几个图片文件替换成你的启动图片 -->
