import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

/// shared_preferences缓存插件方法封装
class SpUtil {
  static SpUtil? _singleton;
  static SharedPreferences? _prefs;
  static final Lock _lock = Lock();

  /// 初始化SharedPreferences缓存对象
  static Future<SpUtil> getInstance() async {
    await _lock.synchronized(() async {
      if (_prefs == null) {
        _singleton = SpUtil._();
        _prefs = await SharedPreferences.getInstance();
      }
    });
    return _singleton as SpUtil;
  }

  SpUtil._();

  /// 设置变量到缓存中去，返回设置缓存结果，true成功，false失败。
  /// 支持String、int、double、bool类型，
  Future<bool> setData<T>(String key, T value) async {
    if (_prefs == null) await getInstance();
    bool? resData = false;
    switch (value.runtimeType) {
      case String:
        resData = await _prefs?.setString(key, value as String);
        break;
      case bool:
        resData = await _prefs?.setBool(key, value as bool);
        break;
      case int:
        resData = await _prefs?.setInt(key, value as int);
        break;
      case double:
        resData = await _prefs?.setDouble(key, value as double);
        break;
      default:
    }
    // 修改前：return resData;
    // 修改后：
    return resData ?? false;
  }

  /// 设置list类型到缓存中去
  ///
  /// [cast] 是否强制转换，强制转换成字符串有可能会转换的不完整
  Future<bool> setListData<T>(String key, List<T> value,
      {bool cast = false}) async {
    if (_prefs == null) await getInstance();
    List<String> dataList = value.map((v) {
      return cast ? v.toString() : json.encode(v);
    }).toList();
    return await _prefs?.setStringList(key, dataList) as bool;
  }

  /// 设置Map类型到缓存中去,
  /// [cast] 是否强制转换，强制转换成字符串有可能会转换的不完整
  Future<bool> setMapData<T>(String key, T value,
      {bool cast = false}) async {
    if (_prefs == null) await getInstance();
    String newValue = cast ? value.toString() : json.encode(value);
    return await _prefs?.setString(key, newValue) as bool;
  }

  /// 获取缓存数据，只能获取常规类型，如需要获取复杂类型，使用自定义获取缓存结构类型的方法。
  ///
  /// [defValue] 自定获取key时的默认值，当为空null时，会返回你自定义的默认值
  Future<T> getData<T>(String key, {T? defValue}) async {
    if (_prefs == null) await getInstance();
    T resData;
    switch (T) {
      case String:
        resData = (_prefs?.getString(key) ?? defValue) as T;
        break;
      case bool:
        resData = (_prefs?.getBool(key) ?? defValue) as T;
        break;
      case int:
        resData = (_prefs?.getInt(key) ?? defValue) as T;
        break;
      case double:
        resData = (_prefs?.getDouble(key) ?? defValue) as T;
        break;
      default:
        resData = await getDynamic(key, defValue: defValue) as T;
    }
    return resData;
  }

  /// 获取Map类型缓存，内部类型未定义
  Future<T> getMap<T>(String key, {T? defValue}) async {
    if (_prefs == null) await getInstance();
    String data = _prefs?.getString(key) ?? '';
    if (data.isNotEmpty) return json.decode(data) as T;
    return defValue ?? {} as T;
  }

  /// 获取自定义的Map类型数据
  /// 第二参数Fn自定义转换结果，，并返回类型
  Future<T> getMapCustom<T>(String key, T Function(Object v) f) async {
    if (_prefs == null) await getInstance();
    Object mapData = await getMap(key);
    return f(mapData);
  }

  /// 获取普通的List<Map>类型
  Future<List<T>> getList<T>(String key, {List<T>? defValue}) async {
    if (_prefs == null) await getInstance();
    List<String> dataList =
        (_prefs?.getStringList(key) ?? defValue ?? []) as List<String>;
    return dataList.map((value) {
      T dataMap = json.decode(value) as T;
      return dataMap;
    }).toList();
  }

  /// 获取自定义的List类型的数据
  /// 第二参数Fn自定义转换结果，并返回类型
  Future<List<T>> getListCustom<T>(String key, T Function(T v) f,
      {List<T>? defValue}) async {
    if (_prefs == null) await getInstance();
    List<T> list = await getList<T>(key, defValue: defValue);
    list = list.map((value) => f(value)).toList();
    return list;
  }

  /// 获取缓存数据，返回dynamic类型
  Future<dynamic> getDynamic(String key, {Object? defValue}) async {
    if (_prefs == null) await getInstance();
    return _prefs?.get(key) ?? defValue;
  }

  /// 获取所有Key
  Future<Set<String>> getKeys() async {
    if (_prefs == null) await getInstance();
    return _prefs?.getKeys() as Set<String>;
  }

  /// 查找是否有指定key
  Future<bool> hasKey(String key) async {
    if (_prefs == null) await getInstance();
    return _prefs?.getKeys().contains(key) as bool;
  }

  /// 移除指定key缓存
  Future<bool> remove(String key) async {
    if (_prefs == null) await getInstance();
    return _prefs?.remove(key) as bool;
  }

  /// 清空所有缓存
  Future<bool> clear() async {
    if (_prefs == null) await getInstance();
    return _prefs?.clear() as bool;
  }

  /// 重新加载缓存数据
  Future<void> reload() async {
    if (_prefs == null) await getInstance();
    _prefs?.reload();
  }
}
