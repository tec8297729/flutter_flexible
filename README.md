# flexible脚手架介绍

无需任何复杂繁琐配置，简单上手即可开发项目的脚手架。
功能不断完善，欢迎留下您的宝贵意见！

内置功能：
1、状态管理：集成Mobx和Provider在Flutter项目中（任意选择使用）。并且你可以选择去中心化管理你的store值。
2、内置路由构建，支持别名传参，简单易有，无需任何插件支持
3、页面路由跳转容错处理，未声明路由跳转错误，指定跳转到错误页面。不需要任何配置，你只需要在ErrorPage页面更改你的样式即可。
4、全局主题换色，只需要配置好你的主题颜色放入到指定的lib/constants/themes 目录中即可



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


### 启动tips
如果你是使用mobx状态管理开发的，日常需要开始监听文件夹实时编译mobx相关文件（可以在你项目启动完后开启），输入以下命令:
```
npm run watch
```

否则的话直接启动项目npm start

----------


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


公共方法中已经抽离请求组件dio，可直接使用
```
import 'package:flexible/utils/dio/safeRequest.dart';
// 请求组件使用，同dio组件request方法
safeRequest('http://url').then((res) {});
```