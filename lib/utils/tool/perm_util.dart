import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'deviceInfo_util.dart';

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
    if (Platform.isAndroid) {
      int androidInfoSdkVersion = await getAndroidInfoSdkVersion();

    // 安卓高版本兼容
    if (androidInfoSdkVersion > 29) {
      PermissionStatus status = await Permission.manageExternalStorage.status;
      if (status != PermissionStatus.granted) {
        final statuses = await [Permission.manageExternalStorage].request();
        return statuses[Permission.manageExternalStorage] ==
            PermissionStatus.granted;
      }
    } else {
      PermissionStatus status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final statuses = await [Permission.storage].request();
        return statuses[Permission.storage] == PermissionStatus.granted;
      }
    }
    return true;
    } else {
      // 其他平台暂不处理
      return true;
    }
    
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
