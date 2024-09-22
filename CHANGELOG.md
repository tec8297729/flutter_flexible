# 近期更新记录

## v2.1.7
- 过滤web端升级APP下载弹层
- 修复ota_update打包失败问题 [npm run build失败](https://github.com/tec8297729/flutter_flexible/issues/17)

## v2.1.6
- flutter升级3.24.2兼容处理
- 修复web端permission_handler报错问题

## v2.1.4
- 修复动态设置dio baseUrl
- 更新jh_debug

## v2.1.3
- 升级flutter及相关插件包，调整兼容插件相关语法

## v2.1.2
- 更新ios、android、linux、macos目录基础文件
- 升级所有第三方依赖包
- package_info 依赖包替换 package_info_plus
- ota_update4版本升级到5

## v2.1.1

- flutter 3.7.7兼容，并更新依赖包
- 调整语法规范

## v2.1.0

- 新增打包标记渠道变量ANDROID_CHANNEL
- 修复全屏退出时，动态样式不正确问题
- 修复监听键盘弹起问题

## v2.0.3

- 修复web端报错问题（Another exception was thrown: Unsupported operation: Platform._operatingSystem）

## v2.0.2

- 新增打包window、web打包命令，并且调整打包命令，统一风格
- 调整request文件位置至dio目录内

## v2.0.1

- 修复flutter 3中针对空安全警告
- layouts迁移至components目录

## v2.0.0

- 调整sdk>=2.12.0版本，并且调整代码语法规范
- 升级ios、android项目对flutter新版本(1.12)支持
- 优化主题色模板已废弃字段
- 调整目录结构及代码，符合官方默认lint规范标准
- 调整更新app强制更新时，逻辑交互
- 内置lint功能，lint规则默认使用flutter官方规则，代码有严格要求
