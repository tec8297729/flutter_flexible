import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

/// 权限申请相关方法
class PermUtils {
  /// 存储权限申请
  static Future<bool> storagePerm() async {
    if (Platform.isAndroid) {
      // 权限检查
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        var permissions = await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]);
        return permissions[PermissionGroup.storage] == PermissionStatus.granted;
      }
    }
    return true;
  }
}
