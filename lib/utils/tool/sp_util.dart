import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

/// shared_preferences缓存插件方法封装
class SpUtil {
  static SpUtil _singleton;
  static SharedPreferences _prefs;
  static Lock _lock = Lock();

  /// 初始化本地缓存对象
  static Future<SpUtil> getInstance() async {
    await _lock.synchronized(() async {
      if (_prefs == null) {
        // 初始化持久化库
        _singleton = SpUtil._();
        _prefs = await SharedPreferences.getInstance();
      }
    });
    return _singleton;
  }

  SpUtil._();

  /// 设置变量到缓存中去，返回设置缓存结果，true成功，false失败。
  /// 支持String、int、double、bool类型，
  static Future<bool> setData(String key, value) async {
    if (_prefs == null) return null;
    bool resData = false;
    switch (value.runtimeType) {
      case String:
        resData = await _prefs.setString(key, value);
        break;
      case bool:
        resData = await _prefs.setBool(key, value);
        break;
      case int:
        resData = await _prefs.setInt(key, value);
        break;
      case double:
        resData = await _prefs.setDouble(key, value);
        break;
      default:
    }
    return resData;
  }

  /// 设置list类型到缓存中去
  ///
  /// [cast] 是否强制转换，强制转换成字符串有可能会转换的不完整
  static Future<bool> setListData(String key, List value,
      {bool cast: false}) async {
    List<String> _dataList = value?.map((v) {
      return cast ? v.toString() : json.encode(v);
    })?.toList();
    return await _prefs.setStringList(key, _dataList);
  }

  /// 设置Map类型到缓存中去,
  /// [cast] 是否强制转换，强制转换成字符串有可能会转换的不完整
  static Future<bool> setMapData(String key, Map value,
      {bool cast: false}) async {
    String newValue = cast ? value.toString() : json.encode(value);
    return await _prefs.setString(key, newValue);
  }

  /// 获取缓存数据，只能获取常规类型，如需要获取复杂类型，使用自定义获取缓存结构类型的方法。
  ///
  /// [defValue] 自定获取key时的默认值，当为空null时，会返回你自定义的默认值
  ///
  /// ```dart
  /// // 指定返回类型
  /// bool res = SpUtil.getData<bool>('key');
  /// ```
  static T getData<T>(String key, {T defValue}) {
    if (_prefs == null) return null;
    T resData;
    switch (T) {
      case String:
        resData = (_prefs.getString(key) ?? defValue) as T;
        break;
      case bool:
        resData = (_prefs.getBool(key) ?? defValue) as T;
        break;
      case int:
        resData = (_prefs.getInt(key) ?? defValue) as T;
        break;
      case double:
        resData = (_prefs.getDouble(key) ?? defValue) as T;
        break;
      default:
        resData = getDynamic(key, defValue: defValue);
    }
    return resData;
  }

  /// 获取Map类型缓存，内部类型未定义
  static Map getMap(String key) {
    String _data = _prefs.getString(key);
    return _data.isNotEmpty ? json.decode(_data) : {};
  }

  /// 获取自定义的Map类型数据
  /// 第二参数Fn自定义转换结果，，并返回类型
  static T getMapCustom<T>(String key, T f(Map v)) {
    if (_prefs == null) return null;
    Map mapData = getMap(key) ?? {};
    return f(mapData);
  }

  /// 获取普通的List<Map>类型
  static List<T> getList<T>(String key) {
    List<String> dataLis = _prefs.getStringList(key) ?? [];
    return dataLis?.map((value) {
      T _dataMap = json.decode(value);
      return _dataMap;
    })?.toList();
  }

  /// 获取自定义的List类型的数据
  /// 第二参数Fn自定义转换结果，并返回类型
  static List<T> getListCustom<T>(String key, T f(T v)) {
    if (_prefs == null) return null;
    List<T> list = getList<T>(key)?.map((value) {
      return f(value);
    })?.toList();
    return list ?? [];
  }

  /// 获取缓存数据，返回dynamic类型
  static getDynamic(String key, {Object defValue}) {
    if (_prefs == null) return defValue;
    return _prefs.get(key) ?? defValue;
  }

  /// 获取所有Key
  static Set<String> getKeys() {
    if (_prefs == null) return null;
    return _prefs.getKeys();
  }

  /// 查找是否有指定key
  static bool haveKey(String key) {
    if (_prefs == null) return null;
    return _prefs.getKeys().contains(key);
  }

  /// 移除指定key缓存
  static Future<bool> remove(String key) {
    if (_prefs == null) return null;
    return _prefs.remove(key);
  }

  /// 清空所有缓存
  static Future<bool> clear() {
    if (_prefs == null) return null;
    return _prefs.clear();
  }

  /// 重新加载缓存数据
  static Future<void> reload() {
    if (_prefs == null) return null;
    return _prefs.reload();
  }
}
