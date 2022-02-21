import 'package:fluttertoast/fluttertoast.dart';

class Tips {
  /// tosat常规提示
  static Future<bool> info(String text, {ToastGravity? gravity}) async {
    return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM, // 提示位置
      fontSize: 18, // 提示文字大小
    ) as bool;
  }
}
