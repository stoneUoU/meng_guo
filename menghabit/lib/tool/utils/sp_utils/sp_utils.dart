import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 小数据 数据持久化类
class SpUtils {
  SpUtils._internal();

  static SpUtils _spUtils = SpUtils._internal();

  static late SharedPreferences _sp;

  factory SpUtils() {
    return _spUtils;
  }

  //初始化，必须要初始化
  Future<SharedPreferences> init() async {
    _sp = await SharedPreferences.getInstance();
    return _sp;
  }

  static Future<bool> put(String key, Object value) {
    if (value is int) {
      return putInt(key, value);
    } else if (value is String) {
      return putString(key, value);
    } else if (value is bool) {
      return putBool(key, value);
    } else if (value is double) {
      return putDouble(key, value);
    } else if (value is List<String>) {
      return putStringList(key, value);
    }
    throw Exception("存入的不是能存入的数据类型~~~");
  }

  /// put object.
  static Future<bool> putObject(String key, Object? value) {
    return _sp.setString(
        "object_$key", value == null ? "" : json.encode(value));
  }

  static T? getObj<T>(String key, T f(Map v), {T? defValue}) {
    Map? map = getObject(key);
    return map == null ? defValue : f(map);
  }

  static Map? getObject(String key) {
    String? _data = _sp.getString("object_$key");
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  static Future<bool> putObjectList(String key, List<Object> list) {
    List<String> _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return _sp.setStringList(key, _dataList);
  }

  static List<T> getObjList<T>(String key, T f(Map v),
      {List<T> defValue = const []}) {
    List<Map>? dataList = getObjectList(key);
    List<T>? list = dataList?.map((value) {
      return f(value);
    }).toList();
    return list ?? defValue;
  }

  static List<Map<dynamic, dynamic>>? getObjectList(String key) {
    List<String>? dataLis = _sp.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    }).toList();
  }

  static String getString(String key, {String defValue = ''}) {
    return _sp.getString(key) ?? defValue;
  }

  static Future<bool> putString(String key, String value) {
    return _sp.setString(key, value);
  }

  static bool getBool(String key, {bool defValue = false}) {
    return _sp.getBool(key) ?? defValue;
  }

  static Future<bool> putBool(String key, bool value) {
    return _sp.setBool(key, value);
  }

  static int getInt(String key, {int defValue = 0}) {
    return _sp.getInt(key) ?? defValue;
  }

  static Future<bool> putInt(String key, int value) {
    return _sp.setInt(key, value);
  }

  static double getDouble(String key, {double defValue = 0.0}) {
    return _sp.getDouble(key) ?? defValue;
  }

  static Future<bool> putDouble(String key, double value) {
    return _sp.setDouble(key, value);
  }

  static List<String> getStringList(String key,
      {List<String> defValue = const []}) {
    return _sp.getStringList(key) ?? defValue;
  }

  static Future<bool> putStringList(String key, List<String> value) {
    return _sp.setStringList(key, value);
  }

  static dynamic getDynamic(String key, {required Object defValue}) {
    return _sp.get(key) ?? defValue;
  }

  static bool haveKey(String key) {
    return _sp.getKeys().contains(key);
  }

  static Set<String> getKeys() {
    return _sp.getKeys();
  }

  static Future<bool> remove(String key) {
    return _sp.remove(key);
  }

  static Future<bool> clear() {
    return _sp.clear();
  }
}
