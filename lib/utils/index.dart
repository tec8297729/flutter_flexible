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
