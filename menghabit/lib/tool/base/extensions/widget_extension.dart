import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// 设置顶部间距
  Widget marginTop(double top) {
    return margin(top: top);
  }

  /// 设置底部间距
  Widget marginBottom(double bottom) {
    return margin(bottom: bottom);
  }

  /// 设置左边间距
  Widget marginLeft(double left) {
    return margin(left: left);
  }

  /// 设置右边间距
  Widget marginRight(double right) {
    return margin(right: right);
  }

  /// 设置右边内间距
  Widget paddingRight(double right) {
    return padding(right: right);
  }

  /// 设置左边内间距
  Widget paddingLeft(double left) {
    return padding(left: left);
  }

  /// 设置上边内间距
  Widget paddingTop(double top) {
    return padding(top: top);
  }

  /// 设置右边内间距
  Widget paddingBottom(double bottom) {
    return padding(bottom: bottom);
  }

  ///设置边距
  Widget margin(
      {double left = 0, double right = 0, double bottom = 0, double top = 0}) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
      child: this,
    );
  }

  /// 设置内边距
  Widget padding(
      {double left = 0, double right = 0, double bottom = 0, double top = 0}) {
    return Container(
      padding:
          EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
      child: this,
    );
  }
}

extension WidgetWrapExtension on Widget {
  Widget wrapContainer({
    Key? key,
    Alignment? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      child: this,
      clipBehavior: clipBehavior,
    );
  }

  Widget wrapGestureDetector({
    Key? key,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapCallback? onSecondaryTap,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapDownCallback? onTertiaryTapDown,
    GestureTapUpCallback? onTertiaryTapUp,
    GestureTapCancelCallback? onTertiaryTapCancel,
    GestureTapDownCallback? onDoubleTapDown,
    GestureTapCallback? onDoubleTap,
    GestureTapCancelCallback? onDoubleTapCancel,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureLongPressCallback? onSecondaryLongPress,
    GestureLongPressStartCallback? onSecondaryLongPressStart,
    GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate,
    GestureLongPressUpCallback? onSecondaryLongPressUp,
    GestureLongPressEndCallback? onSecondaryLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    return GestureDetector(
      key: key,
      child: this,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onTertiaryTapDown: onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp,
      onTertiaryTapCancel: onTertiaryTapCancel,
      onDoubleTapDown: onDoubleTapDown,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onSecondaryLongPress: onSecondaryLongPress,
      onSecondaryLongPressStart: onSecondaryLongPressStart,
      onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
      onSecondaryLongPressUp: onSecondaryLongPressUp,
      onSecondaryLongPressEnd: onSecondaryLongPressEnd,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onForcePressStart: onForcePressStart,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
    );
  }
}
