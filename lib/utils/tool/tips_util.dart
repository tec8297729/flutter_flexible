import 'package:fluttertoast/fluttertoast.dart';

class Tips {
  /// tosat常规提示
  static Future<void> info(String text, {ToastGravity? gravity}) async {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM, // 提示位置
      fontSize: 18, // 提示文字大小
    );
  }
}
