import 'package:extended_text_field/extended_text_field.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/function/message/viewmodel/message_content_view_model.dart';
import 'package:meng_guo/function/publish/utils/my_special_text_span_builder.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class MessageTipItem extends StatefulWidget {
  final MessageContentItemViewModel contentItemViewModel;
  const MessageTipItem({Key? key, required this.contentItemViewModel})
      : super(key: key);

  @override
  _MessageTipItemState createState() => _MessageTipItemState();
}

class _MessageTipItemState extends State<MessageTipItem> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = widget.contentItemViewModel.content;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseExtendedImage(
            url: widget.contentItemViewModel.userIcon,
            shape: BoxShape.circle,
            defaultSize: 38.px,
            width: 38.px,
            height: 38.px,
            placeHolder: 'assets/images/my/my_header_default.png',
            borderRadius: BorderRadius.circular(10.px),
          ).marginRight(10.px),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(6.5.px, 10.px, 6.5.px, 10.px),
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.px),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contentItemViewModel.title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: color_FF000000,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.px,
                    ),
                  ).marginRight(4.px).marginBottom(6.px),
                  ExtendedTextField(
                    specialTextSpanBuilder: MySpecialTextSpanBuilder(
                      showAtBackground: true,
                    ),
                    scrollPadding: EdgeInsets.zero,
                    style: TextStyle(
                      color: color_FF000000,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.px,
                    ),
                    maxLines: null,
                    readOnly: true,
                    enableInteractiveSelection: false,
                    keyboardAppearance: Brightness.light,
                    controller: textEditingController,
                    decoration: const InputDecoration.collapsed(
                      hintText: '',
                    ),
                  ),
                  // Text(
                  //   contentItemViewModel.content,
                  //   style: TextStyle(
                  //     color: color_FF000000,
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 14.px,
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
