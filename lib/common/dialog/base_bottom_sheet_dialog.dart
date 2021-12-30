import 'package:flutter/material.dart';
import 'package:meng_guo/common/dialog/base_bottom_sheet.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

abstract class BaseBottomSheetDialog extends StatelessWidget {
  final Color? safeAreaBottomColor;
  BaseBottomSheetDialog({Key? key, this.safeAreaBottomColor}) : super(key: key);

  Future<T?> show<T>(
    BuildContext context, {
    Widget? archerChild,
    required bool isDismissible,
    required bool isScrollControlled,
    bool? enableDrag,
  }) {
    return showCommonModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: build,
      enableDrag: enableDrag == null ? true : enableDrag,
      archerChild: archerChild,
    );
  }

  /// Desc: 构建内容布局
  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: SingleChildScrollView(
        primary: false,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.px),
                topRight: Radius.circular(16.px)),
          ),
          child: Column(
            children: [
              Container(
                height: 37.px,
                child: Center(
                  child: Image.asset(
                    'assets/images/common/home_indicator.png',
                  ),
                ),
              ),
              buildContent(context),
              Container(
                color: safeAreaBottomColor == null
                    ? Colors.white
                    : safeAreaBottomColor,
                height: ScreenUtils.padBotH(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
