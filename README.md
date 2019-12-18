# flexible脚手架介绍

无需任何复杂繁琐配置，简单上手即可开发项目的脚手架。
功能不断完善，欢迎留下您的宝贵意见！

内置功能：
1、状态管理：集成Mobx和Provider在Flutter项目中（任意选择使用）。并且你可以选择去中心化管理你的store值。
2、使用flutter内置路由构建，支持别名传参，无需任何插件支持！简单易用，无学习成本。
3、页面路由跳转容错处理，未声明路由跳转错误，指定跳转到错误页面。能让你第一时间发现低级错误bug，友好提示页面清晰明了。
4、全局主题换色，只需要配置好你的主题颜色放入到指定的lib/constants/themes 目录中即可

## 文件夹结构
这是项目中一直会使用的结构
    lib/
    |- constants/ # 常量文件夹
    |- components/ # 共用widget组件封装
    |- model/ # 全局状态管理store数据
    |- pages/ # 页面ui层，每个独立完整的页面
    |- utils/ # 公共方法抽离
    |- service/ # 请求接口抽离层
    |- routes/
      |- routesInit.dart # 定义路由页面
    |- main.dart # 入口文件

<br/>
公共方法中已经抽离请求组件dio，可直接使用
```
import 'package:flexible/utils/dio/safeRequest.dart';
// 请求组件使用，同dio组件request方法
safeRequest('http://url').then((res) {});
```

<br/>
# 快速上手

## 启动项目
下载此仓库文件后，进入项目目录文件夹

初始化安装依赖包以及启用APP（记的开启你的模拟器）
输入以下命令：
```
npm run initApp
npm start
```
二条命令需要开启二个窗口，或是initApp初始化后，直接vscode中按F5启动项目也可。
<br/>


tips：如果你是使用mobx状态管理开发的，日常需要开始监听文件夹实时编译mobx相关文件（可以在你项目启动完后开启），输入以下命令:

```
npm run watch
```

否则的话直接启动项目npm start

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

|       命令        |                                说明                                 |
| :---------------: | :-----------------------------------------------------------------: |
|     npm start     |               启动APP项目，请提前开好模拟器或连接真机               |
|   npm run watch   |          监听mobx相关文件变动，如有变动实时生成.g.dart文件          |
| npm run watch:fix | 进行修复mobx生成的文件并且开始监听，如wacth模式不行，尝试此模式修复 |
|   npm run build   |              打包项目生成APP，会打包安卓和IOS二个版本               |
| npm run build:apk |                        打包生成安卓的APP文件                        |
| npm run build:ios |                        打包生成IOS的APP文件                         |
| npm run build:web |                       打包生成纯前端web的文件                       |
|   npm run upsdk   |        更新sdk版本，全局的flutter和dart版本将更新为最新版本         |
