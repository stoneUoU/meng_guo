import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/menghabit.dart';

///全局图片加载框架
class BaseExtendedImage extends StatelessWidget {
  ///实际加载的地址
  final String? url;

  final String? placeHolder;

  final BoxShape? shape;

  final BoxBorder? border;

  final BorderRadius? borderRadius;

  final double? cacheWidth;

  final double? cacheHeight;

  final Widget? loadingWidget;

  final double? aspectRatio;

  final double? height;

  final double? width;

  final BoxFit? fit;

  /// 缺省图那只鸟的宽高
  final double defaultSize;

  final double? placeHolderHeight;
  final double? placeHolderWidth;

  BaseExtendedImage(
      {Key? key,
      required this.url,
      this.placeHolder,
      this.shape,
      this.border,
      this.borderRadius,
      this.cacheWidth,
      this.cacheHeight,
      this.loadingWidget,
      this.aspectRatio,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.defaultSize = 40,
      this.placeHolderHeight,
      this.placeHolderWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url ?? '',
      shape: shape,
      border: border,
      fit: BoxFit.cover,
      borderRadius: borderRadius,
      height: height,
      width: width,
      cache: true,
      loadStateChanged: (ExtendedImageState value) {
        if (value.extendedImageLoadState == LoadState.loading) {
          return placeHolderWidget(
              loadingWidget, placeHolder, cacheWidth, cacheHeight, defaultSize);
        } else if (value.extendedImageLoadState == LoadState.failed) {
          return placeHolderWidget(
              loadingWidget, placeHolder, cacheWidth, cacheHeight, defaultSize);
        }
        return null;
      },
    );
  }

  //占位图
  Widget placeHolderWidget(Widget? loadingWidget, String? placeHolder,
      double? cacheWidth, double? cacheHeight, double defaultSize) {
    if (cacheWidth != null && defaultSize >= cacheWidth) {
      defaultSize = cacheWidth / 2;
    }
    return loadingWidget ??
        Container(
          // color: color_ffF1F1F1,
          width: cacheWidth,
          height: cacheHeight,
          alignment: Alignment.center,
          child: Image.asset(
            placeHolder ?? 'assets/images/common/common_default_square.png',
            fit: BoxFit.fitWidth,
            width: placeHolderWidth ?? defaultSize.px,
            // width:  defaultSize.px,
            height: placeHolderHeight ?? defaultSize.px,
            // height: defaultSize.px,
          ),
        );
  }
}
