import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

/// 权限申请相关方法
class PermUtils {
  /// 基础权限申请
  static Future initPermissions() async {
    storagePerm();
    cameraPerm();
  }

  /// 存储权限申请
  static Future<bool> storagePerm() async {
    // 权限检查
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      var permissions = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      return permissions[PermissionGroup.storage] == PermissionStatus.granted;
    }
    return true;
  }

  /// 相册权限申请
  static Future<bool> cameraPerm() async {
    // 权限检查
    PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (permission != PermissionStatus.granted) {
      var permissions = await PermissionHandler()
          .requestPermissions([PermissionGroup.camera]);
      return permissions[PermissionGroup.camera] == PermissionStatus.granted;
    }
    return true;
  }
}
