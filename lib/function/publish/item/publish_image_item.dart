import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class PublishImageItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onDelete;
  const PublishImageItem(
      {Key? key, required this.imageUrl, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8.px, 8.px, 8.px),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topEnd,
        children: [
          BaseExtendedImage(
            url: imageUrl,
            shape: BoxShape.rectangle,
            defaultSize: (ScreenUtils.screenW() - 32.px - 12.px) / 3,
            width: (ScreenUtils.screenW() - 32.px - 12.px) / 3,
            height: (ScreenUtils.screenW() - 32.px - 12.px) / 3,
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.px,
              ),
            ),
          ),
          Positioned(
            top: -8.px,
            right: -8.px,
            child: IconButton(
                onPressed: () {
                  onDelete.call();
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/images/common/common_image_delete.png',
                  // fit: BoxFit.fill,
                  width: 30.px,
                  height: 30.px,
                )),
          )
        ],
      ),
    );
  }
}
