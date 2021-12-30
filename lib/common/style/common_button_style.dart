import 'package:flutter/material.dart';

/// 通用按钮style，支持边距，圆角设置，默认橙色
class CommonButtonStyle extends ButtonStyle {
  CommonButtonStyle({
    Color? color,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Color? overlayColor,
    AlignmentGeometry? alignment,
  }) : super(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all(Size(0, 0)),
          overlayColor: overlayColor == null
              ? null
              : MaterialStateProperty.all(overlayColor),
          backgroundColor: color == null
              ? MaterialStateProperty.all(Colors.transparent)
              : MaterialStateProperty.all(color),
          padding: padding == null ? null : MaterialStateProperty.all(padding),
          alignment: alignment == null ? Alignment.center : alignment,
          shape: borderRadius == null
              ? null
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                ),
        );
}
