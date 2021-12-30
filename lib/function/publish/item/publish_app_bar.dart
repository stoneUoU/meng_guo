import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/menghabit.dart';

class PublishAppBar extends StatelessWidget {
  final VoidCallback publishOnTap;
  const PublishAppBar({Key? key, required this.publishOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          height: ScreenUtils.navigationBarHeight(),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: ScreenUtils.padTopH()),
          width: kToolbarHeight,
          height: kToolbarHeight,
          child: CommonHighLightIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            iconSize: Size(20.px, 20.px),
            imageName: 'assets/images/common_close2.png',
            package: 'menghabit',
            iconColor: Colors.black,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: ScreenUtils.padTopH(), right: 16.px),
            height: kToolbarHeight,
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.5.px, vertical: 7.px),
                decoration: BoxDecoration(
                  color: Color(0xFF3699FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(14.px),
                  ),
                ),
                child: Text(
                  '发布',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.px,
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ).wrapGestureDetector(
            onTap: () {
              publishOnTap.call();
            },
            behavior: HitTestBehavior.translucent,
          ),
        ),
      ],
    );
  }
}
