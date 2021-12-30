import 'package:meng_guo/colors/colors.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class PublishSearchItem extends StatelessWidget {
  final String title;
  final VoidCallback onTapCallBack;
  const PublishSearchItem(
      {Key? key, required this.title, required this.onTapCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTopTipItem(context);
  }

  Widget _buildTopTipItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 9.5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.px, 8.px, 20.5.px, 8.px),
            decoration: BoxDecoration(
              color: const Color(0xFFF5FAFF),
              borderRadius: BorderRadius.all(Radius.circular(16.px)),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/home/home_tip.png')
                    .marginRight(11.5.px),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 13.px,
                      color: color_FF676767,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/home/home_arrow_right.png'),
        ],
      ),
    ).wrapGestureDetector(
      onTap: () {
        onTapCallBack.call();
      },
      behavior: HitTestBehavior.translucent,
    );
  }
}
