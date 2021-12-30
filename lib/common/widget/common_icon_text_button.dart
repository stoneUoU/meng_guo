import 'package:flutter/material.dart';
import 'package:menghabit/menghabit.dart';

enum ButtonImagePosition {
  /// 图片在左
  left,

  /// 图片在右
  right,

  /// 图片在上
  top,
}

class CommonIconTextButton extends StatelessWidget {
  /// 按钮标题
  final String title;

  /// 标题样式
  final TextStyle textStyle;

  /// 图片
  final String imageName;

  /// 图片大小
  final Size imageSize;

  /// 图片与文本间距
  final double padding;

  /// 图片位置-left、right
  final ButtonImagePosition imagePosition;

  /// 点击回调
  final VoidCallback onTap;

  /// 点击区域是否为图片，默认否
  final bool isTapImage;

  /// 是否换行
  final bool isMultipleLine;

  final bool isMultipleAndCenter;

  const CommonIconTextButton({
    Key? key,
    this.textStyle = const TextStyle(color: Colors.red),
    this.imageSize = const Size(10, 10),
    required this.onTap,
    required this.title,
    required this.imageName,
    this.imagePosition = ButtonImagePosition.left,
    this.padding = 0,
    this.isTapImage = false,
    this.isMultipleLine = false,
    this.isMultipleAndCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 图片在左
    if (imagePosition == ButtonImagePosition.left) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: !isTapImage ? onTap : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: isMultipleLine
              ? isMultipleAndCenter
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: isTapImage ? onTap : null,
              child: imageName.isEmpty
                  ? const SizedBox()
                  : Image.asset(
                      imageName,
                      width: imageSize.width,
                      height: imageSize.height,
                    ),
            ),
            SizedBox(
              width: padding,
            ),
            isMultipleLine
                ? Expanded(
                    child: Container(
                      child: Text(
                        title,
                        style: textStyle,
                      ),
                    ),
                  )
                : Container(
                    child: Text(
                      title,
                      style: textStyle,
                    ),
                  ),
          ],
        ),
      );
    } else if (imagePosition == ButtonImagePosition.right) {
      /// 图片在右
      return Container(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: !isTapImage ? onTap : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  title,
                  style: textStyle,
                ),
              ).paddingBottom(1),
              SizedBox(
                width: padding,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: isTapImage ? onTap : null,
                child: imageName.isEmpty
                    ? SizedBox()
                    : Image.asset(
                        imageName,
                        width: imageSize.width,
                        height: imageSize.height,
                      ),
              ),
            ],
          ),
        ),
      );
    } else {
      /// 图片在上
      return Container(
        child: GestureDetector(
          onTap: !isTapImage ? onTap : null,
          behavior: HitTestBehavior.translucent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: isTapImage ? onTap : null,
                child: imageName.isEmpty
                    ? SizedBox()
                    : Image.asset(
                        imageName,
                        width: imageSize.width,
                        height: imageSize.height,
                        fit: BoxFit.fill,
                      ),
              ),
              SizedBox(
                height: padding,
              ),
              Container(
                child: Text(
                  title,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
