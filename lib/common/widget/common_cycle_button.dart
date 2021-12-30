import 'package:flutter/material.dart';
import 'package:meng_guo/common/style/common_button_style.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/constants/colors.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

TextStyle _commonBtnTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.px,
  fontWeight: FontWeight.w500,
);

EdgeInsets _commonMargin = EdgeInsets.symmetric(
  vertical: 16.px,
);

class CommonCycleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;
  final String title;
  final double radius;
  final EdgeInsets padding;
  final double height;
  final TextStyle textStyle;
  final EdgeInsets margin;

  CommonCycleButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.radius = 20.0,
    this.height = 40,
    this.padding = const EdgeInsets.fromLTRB(
      17,
      5,
      17,
      5,
    ),
    EdgeInsets? margin,
    TextStyle? testStyle,
    Color? bgColor,
  })  : this.textStyle = testStyle ?? _commonBtnTextStyle,
        this.color = bgColor ?? color_FF4CD080,
        this.margin = margin ?? _commonMargin,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.screenW(),
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: onTap != null ? onTap : null,
        style: CommonButtonStyle(
          color: color,
          padding: padding,
          borderRadius: BorderRadius.all(
            Radius.circular(
              radius,
            ),
          ),
        ),
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
