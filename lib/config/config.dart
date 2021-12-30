import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menghabit/tool/utils/sp_utils/sp_utils.dart';

class Config {
  /// Main方法执行前的相关操作
  static Future dispatchRunMainBefore() async {
    WidgetsFlutterBinding.ensureInitialized();
    // 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return await SpUtils().init();
  }
}
