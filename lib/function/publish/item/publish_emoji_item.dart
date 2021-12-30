import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/publish/viewmodel/publish_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/keyboard_utils.dart';

class PublishEmojiItem extends StatefulWidget {
  final ValueChanged<EmojiListRespEntity> onTapCallBack;
  const PublishEmojiItem({Key? key, required this.onTapCallBack})
      : super(key: key);

  @override
  _PublishEmojiItemState createState() => _PublishEmojiItemState();
}

class _PublishEmojiItemState extends State<PublishEmojiItem> {
  @override
  Widget build(BuildContext context) {
    PublishViewModel viewModel = context.viewModel<PublishViewModel>();
    return ValueListenableBuilder<List<EmojiListRespEntity>?>(
        valueListenable: viewModel.emojis,
        builder: (context, value, child) {
          if (value.orEmptyList().isEmpty) {
            return SizedBox();
          }
          return Container(
            height: 250.px,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                crossAxisSpacing: 12.px,
                mainAxisSpacing: 12.px,
              ),
              itemBuilder: (context, index) {
                return BaseExtendedImage(
                  url: value![index].url,
                  shape: BoxShape.circle,
                  defaultSize: 20.px,
                  width: 20.px,
                  height: 20.px,
                  placeHolder: 'assets/images/my/my_header_default.png',
                  // height: 250.px,
                ).wrapGestureDetector(onTap: () {
                  widget.onTapCallBack.call(value[index]);
                });
              },
              itemCount: value!.length,
            ),
          ).wrapGestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.translucent,
          );
        });
  }
}
