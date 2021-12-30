import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatformUtils {
  static const MethodChannel _channel = const MethodChannel('chongmeng');

  static String get operatingSystem => _operatingSystem();

  static final bool isLinux = (operatingSystem == "linux");

  static final bool isMacOS = (operatingSystem == "macos");

  static final bool isWindows = (operatingSystem == "windows");

  static final bool isAndroid = (operatingSystem == "android");

  static final bool isIOS = (operatingSystem == "ios");

  static final bool isFuchsia = (operatingSystem == "fuchsia");

  static final bool isWeb = (operatingSystem == "web");

  static Future<String> getChannel() async {
    if (Platform.isIOS) return Future.value("ios");
    var sp = await SharedPreferences.getInstance();
    String channelName = (await _channel.invokeMethod("getChannel")).toString();
    String? spChannelName = sp.getString("channelName");
    if (spChannelName == null) {
      sp.setString("channelName", channelName);
      return channelName;
    } else {
      return spChannelName;
    }
  }

  static Future<String> openGPS() async {
    return await _channel.invokeMethod("openGPS");
  }

  static Future<String> getIM(
      String appKey, String userName, String userId) async {
    return await _channel.invokeMethod(
        "IM", {"appkey": appKey, "userName": userName, "userId": userId});
  }

  static Future<String> getAddress(double latitude, double longitude) async {
    return await _channel.invokeMethod(
        "getAddress", {"latitude": latitude, "longitude": longitude});
  }

  //安卓唯一标识
  static Future<String?> get imsi async {
    return await _channel.invokeMethod<String>("imsi");
  }

  //idfa(ios only)
  static Future<String?> get idfa async {
    return await _channel.invokeMethod<String>("idfa");
  }

  //安卓 getWifiMac
  static Future<String?> get getWifiMac async {
    return _channel.invokeMethod<String>("getWifiMac");
  }

  /// Desc: 获取平台类型，修复web端调用报错的问题
  /// Return：String 返回平台类型
  static String _operatingSystem() {
    if (kIsWeb) {
      return "web";
    } else {
      return Platform.operatingSystem;
    }
  }
}
