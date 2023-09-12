import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/material/language_utils.dart';

/// Desc:  多语言适配
/// <p>
/// Date: 4/20/21
/// Copyright: Copyright (c) 2010-2021
/// Updater:
/// Update Time:
/// Update Comments:
/// Param [T]  外部多语言 S 对象
///

T getLanguage<T>() {
  final instance = Localizations.of<T>(globalContext.values.first, T);
  assert(instance != null, 'No instance of $T ');
  return instance!;
}
