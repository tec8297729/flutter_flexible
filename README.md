# flexible

使用了Mobx和Provider在Flutter项目中为作为状态管理。
可单独直接使用Provider管理你的状态。

如果出现不兼容新版本情况，请使用以下指定版本
v1.9.1+hotfix.4
Dart 2.5.0

## 启动项目
**第一步：**
下载此仓库文件后，进入项目目录文件夹
转到项目根目录并在控制台中执行以下命令以获取所需的依赖关系：
```
flutter pub get
```

**第二步：**
该项目使用inject可用于代码生成的库，执行以下命令来生成文件：
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

或watch命令以保持源代码自动同步：
```
flutter packages pub run build_runner watch
```

**第三步**
启动项目
```
flutter run
```


----------


## 文件夹结构

这是flutter提供的核心文件夹结构。

    flutter-app/
    |- android
    |- build
    |- ios
    |- lib
    |- test

这是项目中一直会使用的结构

    lib/
    |- constants/ # 常量文件夹
    |- components/ # 共用widget组件封装
    |- stores/ # 状态管理store数据
    |- pages/ # 页面ui层，每个独立完整的页面
    |- utils/ # 公共方法抽离
    |- routes/
      |- routesInit.dart # 定义路由页面
    |- main.dart # 入口文件


公共方法中已经抽离请求组件dio，可直接使用
```
import 'package:flexible/utils/dio/safeRequest.dart';
// 请求组件使用，同dio组件request方法
safeRequest('http://url').then((res) {});
```