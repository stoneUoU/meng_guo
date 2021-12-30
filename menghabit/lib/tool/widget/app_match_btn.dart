import 'package:flutter/material.dart';
import 'package:menghabit/tool/constants/colors.dart';

/// 构建一个全屏的按钮
Widget buildMatchParentButton({
  required String btnTitle,
  required double btnTitleSp,
  required VoidCallback? onPressed,
  required double? btnHeight,
  required double? btnRadius,
  required Color? color,
}) {
  return SizedBox(
    height: btnHeight ?? 40,
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color ?? color66FFA22D),
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(btnRadius ?? 6.0),
              ),
            ),
          )),
      onPressed: () => {
        if (onPressed != null) {onPressed()}
      },
      child: Text(
        btnTitle,
        style: TextStyle(fontSize: btnTitleSp, color: Colors.white, height: 1),
      ),
    ),
  );
}
