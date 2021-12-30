import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class TransparentAppBar extends StatelessWidget {
  final String title;
  final Color color;
  final bool hasBack;
  final Widget? action;
  const TransparentAppBar(
      {Key? key,
      required this.title,
      required this.color,
      this.hasBack = false,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          height: ScreenUtils.navigationBarHeight(),
        ),
        Visibility(
          visible: hasBack,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: ScreenUtils.padTopH()),
            width: kToolbarHeight,
            height: kToolbarHeight,
            child: CommonHighLightIconButton(
              onTap: () {
                Navigator.pop(context);
              },
              iconSize: Size(28.px, 28.px),
              imageName: 'assets/images/common/common_icon_back_light.png',
              iconColor: Colors.white,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: kToolbarHeight,
          margin: EdgeInsets.only(top: ScreenUtils.padTopH()),
          child: Text(
            title,
            style: TextStyle(fontSize: 20.px, color: color),
          ),
        ),
        action != null
            ? Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.only(top: ScreenUtils.padTopH(), right: 16.px),
                  height: kToolbarHeight,
                  width: 40.px,
                  child: action,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
