import 'package:device_info_plus/device_info_plus.dart';

/// 获取安卓 API版本
Future<int> getAndroidInfoSdkVersion() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  int sdkInt = androidInfo.version.sdkInt;
  return sdkInt;
}
