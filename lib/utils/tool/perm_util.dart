import 'package:permission_handler/permission_handler.dart';

/// 权限申请相关方法
class PermUtil {
  /// 基础权限申请
  static Future<void> initPermissions() async {
    if (await Permission.contacts.request().isGranted) return;

    await [
      Permission.storage,
      Permission.camera,
    ].request();
  }

  /// 存储权限申请
  static Future<bool> storagePerm() async {
    PermissionStatus status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      final statuses = await [Permission.storage].request();
      return statuses[Permission.storage] == PermissionStatus.granted;
    }
    return true;
  }

  /// 相册权限申请
  static Future<bool> cameraPerm() async {
    PermissionStatus status = await Permission.camera.status;
    if (status != PermissionStatus.granted) {
      final statuses = await [Permission.camera].request(); // 请求权限
      return statuses[Permission.camera] == PermissionStatus.granted;
    }
    return true;
  }
}
