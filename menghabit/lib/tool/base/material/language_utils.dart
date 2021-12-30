import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 装载全局对话框
final LinkedHashMap<Widget, BuildContext> globalContext = LinkedHashMap();

/// 函数包装类型
typedef GenerateAppLanguage = GenerateAppTitle Function(
    Widget widget, String title, GenerateAppTitleAfter after);

/// 包装全局回调
typedef GenerateAppTitleAfter = void Function(BuildContext context);

/// 包装
final GenerateAppLanguage generateAppLanguage =
    (Widget widget, String title, GenerateAppTitleAfter after) {
  return (BuildContext context) {
    globalContext[widget] = context;
    after.call(context);
    return title;
  };
};

class LanguageUtils {
  ///
  ///
  /// 改方法废弃  具体使用查看 [language_extension.dart]
  ///
  @Deprecated("expires flutter 2.0")
  static Language? getCurrentLanguage<Language>(Type type) {
    return Localizations.of<Language>(globalContext.values.first, type);
  }
}
