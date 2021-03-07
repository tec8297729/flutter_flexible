import 'dart:async';
export 'tool/sp_util.dart' show SpUtil;
export 'tool/perm_util.dart' show PermUtil;
export 'tool/log_util.dart' show LogUtil;

/// 防抖函数
Function debounce(Function fn, [int t = 30]) {
  Timer _debounce;
  return (data) {
    if (_debounce?.isActive ?? false) _debounce.cancel();

    _debounce = Timer(Duration(milliseconds: t), () {
      fn(data);
    });
  };
}

/// 是否是手机号
bool isPhone(String value) {
  return new RegExp(r"^1(3|4|5|7|8)\d{9}$").hasMatch(value);
}
