import 'package:flutter/gestures.dart';
import 'package:meng_guo/common/widget/common_icon_text_button.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/publish/item/publish_emoji_item.dart';
import 'package:meng_guo/function/publish/viewmodel/publish_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/tool/utils/keyboard_utils.dart';

class PublishToolItem extends StatelessWidget {
  final ValueChanged<EmojiListRespEntity> onTapCallBack;
  final VoidCallback emojiOnTap;
  final bool showEmoji;
  const PublishToolItem(
      {Key? key,
      required this.onTapCallBack,
      required this.emojiOnTap,
      required this.showEmoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PublishViewModel viewModel = context.viewModel<PublishViewModel>();
    return Column(
      children: [
        Container(
          color: Color(0xFFF6F5F8),
          padding: EdgeInsets.symmetric(horizontal: 25.px, vertical: 16.px),
          child: Row(
            children: [
              Image.asset('assets/images/publish/publish_meme_icon.png')
                  .marginRight(37.px)
                  .wrapGestureDetector(onTap: () {
                emojiOnTap.call();
              }),
              Image.asset('assets/images/publish/publish_album_icon.png')
                  .wrapGestureDetector(onTap: () {
                viewModel.openAlbum(context);
              }),
              const Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Image.asset(
                              'assets/images/publish/publish_category_icon.png')
                          .marginRight(5.px),
                    ),
                    TextSpan(
                      text: "选择分类",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          viewModel.showCategoryDialog(context);
                        },
                      style: TextStyle(
                          fontSize: 16.px,
                          color: Color(0xFFA2A6B3),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showEmoji,
          child: PublishEmojiItem(onTapCallBack: onTapCallBack),
        )
      ],
    );
  }
}
