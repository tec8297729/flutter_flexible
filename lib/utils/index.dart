import 'dart:async';
export 'tool/sp_util.dart' show SpUtil;
export 'tool/perm_util.dart' show PermUtil;
export 'tool/log_util.dart' show LogUtil;

/// 防抖函数
Function debounce(Function fn, [int t = 30]) {
  Timer? debounceTimer;
  return (data) {
    if (debounceTimer?.isActive ?? false) debounceTimer?.cancel();

    debounceTimer = Timer(Duration(milliseconds: t), () {
      fn(data);
    });
  };
}

/// 是否是手机号
bool isPhone(String value) {
  return RegExp(r"^1(3|4|5|7|8)\d{9}$").hasMatch(value);
}

/// 版本号比较，version1 大于 version2时返回true
bool compareVersion(String version1, String version2) {
  num toNum(String vStr) {
    List<String> c = vStr.trim().split('.');
    if (c.length < 3) c.add('0');
    const r = ['0000', '000', '00', '0', ''];
    for (var i = 0; i < c.length; i++) {
      int len = c[i].length;
      c[i] = r[len] + c[i];
    }
    return int.parse(c.join(''));
  }

  num newVersion1 = toNum(version1);
  num newVersion2 = toNum(version2);

  return newVersion1 > newVersion2;
}
