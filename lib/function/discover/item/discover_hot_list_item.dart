import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_icon_text_button.dart';
import 'package:meng_guo/common/widget/icon_text.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class DiscoverHotListItem extends StatelessWidget {
  final List<String> items;
  const DiscoverHotListItem({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: color_FFF4F3F8,
                width: 1.px,
              ),
            ),
          ),
          height: 45.px,
          padding: EdgeInsets.only(left: 10.px),
          alignment: Alignment.centerLeft,
          child: IconText(
            '最热话题',
            padding: EdgeInsets.only(
              right: 5.px,
            ),
            iconSize: 15.px,
            icon: Image.asset('assets/images/home/home_tip.png'),
            style: TextStyle(
              fontSize: 16.px,
              fontWeight: FontWeight.bold,
              color: color_FF000000,
            ),
          ),
        ).marginBottom(15.px),
        Wrap(
          // spacing: 38.0,
          runSpacing: 4.0,

          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(
            items.length,
            (index) {
              return Container(
                width: ScreenUtils.screenW() / 2 - 32.px,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 25.px,
                      child: Text(
                        '${index + 1}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _fetchColor(index),
                          fontSize: 16.px,
                        ),
                      ).marginLeft(4.px),
                    ),
                    IconText(
                      items[index],
                      padding: EdgeInsets.only(
                        right: 5.px,
                      ),
                      icon: Image.asset(
                          'assets/images/discover/discover_tip_icon.png'),
                      style: TextStyle(
                        fontSize: 16.px,
                        fontWeight: FontWeight.bold,
                        color: color_FF9D9D9D,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ).marginBottom(15.px),
      ],
    );
  }

  Color _fetchColor(int index) {
    switch (index) {
      case 0:
        return color_FFFF3636;
      case 1:
        return const Color(0xFFFF892A);
      case 2:
        return const Color(0xFF2FA501);
      case 3:
        return const Color(0xFFEA00FF);
      default:
        return const Color(0xFFDAD203);
    }
  }
}
