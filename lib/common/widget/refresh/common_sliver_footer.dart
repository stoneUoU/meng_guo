import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';

import 'package:menghabit/menghabit.dart';

class CommonSliverFooter extends StatelessWidget {
  final String? title;
  final Color? footerColor;

  const CommonSliverFooter({Key? key, this.title, this.footerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.px,
      width: double.infinity,
      color: footerColor ?? color_FFF7F9FA,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 18.px),
      child: Text(
        title == null ? '没有更多' : title!,
        style: TextStyle(
          color: color_FF999999,
          fontSize: 14.px,
        ),
      ),
    );
  }
}
