import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class DetailInputWidget extends StatelessWidget {
  final String headUrl;
  final ValueChanged<String> onChangeCallBack;
  const DetailInputWidget(
      {Key? key, required this.headUrl, required this.onChangeCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.px, vertical: 11.px),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFEAEAEA), width: 1.px),
        ),
      ),
      height: 57.px,
      child: Row(
        children: [
          BaseExtendedImage(
            url: headUrl,
            shape: BoxShape.circle,
            defaultSize: 30.px,
            width: 30.px,
            height: 30.px,
            placeHolder: 'assets/images/my/my_header_default.png',
            // height: 250.px,
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(17.5.px),
                  ),
                ),
                margin: EdgeInsets.only(left: 15.px),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '我来冒个泡',
                    hintStyle: TextStyle(
                      color: Color(0xFFA2A6B3),
                      fontSize: 15.px,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.px, bottom: 12.px),
                    suffixIcon: Image.asset(
                      'assets/images/my/my_edit_icon.png',
                      color: Color(0xFFA2A6B3),
                    ),
                  ),
                  keyboardAppearance: Brightness.light,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
