import 'package:flutter/material.dart';
import 'package:menghabit/tool/constants/constants.dart';
import 'package:logger/logger.dart';

class LogUtils {
  static var _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  /// 输出相关信息
  static void d(dynamic msg) {
    if (!isRelease) {
      final pattern = new RegExp('.{1,800}');
      pattern.allMatches(msg).forEach((match) {
        _logger.d(match.group(0));
      });
    }
  }

  /// 输出相关信息
  static void longContent(dynamic msg) {
    if (!isRelease) {
      final pattern = new RegExp('.{1,800}');
      pattern.allMatches(msg).forEach((match) {
        debugPrint(match.group(0));
      });
    }
  }
}
