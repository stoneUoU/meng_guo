// import 'dart:async';
//
// import 'package:flutter/services.dart';
//
// class Menghabit {
//   static const MethodChannel _channel = MethodChannel('menghabit');
//
//   static Future<String?> get platformVersion async {
//     final String? version = await _channel.invokeMethod('getPlatformVersion');
//     return version;
//   }
// }

export 'tool/base/extensions/collections_extension.dart';
export 'tool/base/extensions/number_extension.dart';
export 'tool/base/extensions/object_extension.dart';
export 'tool/base/extensions/screen_extension.dart';
export 'tool/base/extensions/string_extension.dart';
export 'tool/base/extensions/widget_extension.dart';
export 'tool/base/material/language_utils.dart';
export 'tool/base/extensions/language_extension.dart';
export 'view_model.dart';
export 'package:nested/nested.dart';

import 'dart:async';
import 'package:flutter/services.dart';

class Menghabit {
  static const MethodChannel _channel = const MethodChannel('menghabit');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
