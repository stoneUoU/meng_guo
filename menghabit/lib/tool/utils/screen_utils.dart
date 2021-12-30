import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenUtils {
  static late MediaQueryData _mediaQuery;
  static late double _width;
  static late double _height;
  static late double _topbarH;
  static late double _botbarH;
  static late double _pixelRatio;
  static late double _ratio = 0;

  static void init(BoxConstraints constraints, int number) {
    var window = WidgetsBinding.instance?.window ?? ui.window;

    _mediaQuery = MediaQueryData.fromWindow(window);
    var size = _mediaQuery.size;
    _width = size.width;
    _height = size.height;
    _topbarH = _mediaQuery.padding.top;
    _botbarH = _mediaQuery.padding.bottom;
    _pixelRatio = _mediaQuery.devicePixelRatio;
    _ratio = size.width / number;
  }

  static px(number) {
    return number * _ratio;
  }

  static onePx() {
    return 1 / _pixelRatio;
  }

  static screenW() {
    return _width;
  }

  static screenH() {
    return _height;
  }

  static padTopH() {
    return _topbarH;
  }

  static padBotH() {
    return _botbarH;
  }

  static navigationBarHeight() {
    return _mediaQuery.padding.top + kToolbarHeight;
  }
}
