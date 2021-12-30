import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/function/message/viewmodel/message_content_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class MessageMyItem extends StatelessWidget {
  final MessageContentItemViewModel contentItemViewModel;
  const MessageMyItem({Key? key, required this.contentItemViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseExtendedImage(
            url: contentItemViewModel.userIcon,
            shape: BoxShape.circle,
            defaultSize: 38.px,
            width: 38.px,
            height: 38.px,
            placeHolder: 'assets/images/my/my_header_default.png',
            borderRadius: BorderRadius.circular(10.px),
          ).marginRight(10.px),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        contentItemViewModel.title,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: color_FF000000,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.px,
                        ),
                      ).marginRight(4.px),
                    ),
                    Text(
                      contentItemViewModel.time,
                      style: TextStyle(
                        color: Color(0xFF898D90),
                        fontSize: 12.px,
                      ),
                    ),
                  ],
                ).marginBottom(6.px),
                Text(
                  contentItemViewModel.content,
                  style: TextStyle(
                    color: Color(0xFF898D90),
                    fontSize: 14.px,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
