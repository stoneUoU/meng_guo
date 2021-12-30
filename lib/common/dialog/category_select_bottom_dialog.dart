import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:meng_guo/common/widget/icon_text.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/common/dialog/base_bottom_sheet_dialog.dart';
import 'package:meng_guo/function/home/entity/home_category_list_resp_entity.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class CategorySelectBottomSheetDialog extends BaseBottomSheetDialog {
  // final ValueChanged<HomeCategoryListRespEntity> onTapCallBack;
  final List<HomeCategoryListRespEntity> items;

  /// 选中输变化监听
  final ValueNotifier<HomeCategoryListRespEntity?> selectItem =
      ValueNotifier(null);

  CategorySelectBottomSheetDialog(
    this.items, {
    Key? key,
    HomeCategoryListRespEntity? initEntity,
  }) : super() {
    if (initEntity != null) {
      selectItem.value = initEntity;
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom:
              ScreenUtils.padBotH() + ScreenUtils.padBotH() <= 0 ? 50.px : 0),
      child: Container(
        // padding: EdgeInsets.only(top: 9.px),

        constraints: BoxConstraints(maxHeight: 360.px),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            //背景
            color: Colors.white,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(8.px)),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '选择分类',
                      style: TextStyle(
                        color: color_FF000000,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.px,
                      ),
                    ),
                    CommonHighLightIconButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      iconSize: Size(20.px, 20.px),
                      imageName: 'assets/images/common_close2.png',
                      package: 'menghabit',
                      iconColor: Colors.black,
                    ),
                  ],
                ).marginBottom(12.px),
                Wrap(
                  // spacing: 38.0,
                  runSpacing: 8.px,
                  spacing: 8.px,

                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(
                    items.length,
                    (index) {
                      return ValueListenableBuilder<
                              HomeCategoryListRespEntity?>(
                          valueListenable: selectItem,
                          builder: (context, value, child) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.px, horizontal: 11.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.px),
                                ),
                                color: value == items[index]
                                    ? Colors.blue
                                    : Color(0xFFE4E6EB),
                              ),
                              child: Text(
                                items[index].name.toString(),
                                style: TextStyle(
                                  color: value == items[index]
                                      ? Colors.white
                                      : Color(0xFF8A919C),
                                  fontSize: 12.px,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ).wrapGestureDetector(
                              onTap: () {
                                selectItem.value = items[index];
                                Navigator.pop(context);
                              },
                              behavior: HitTestBehavior.translucent,
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<HomeCategoryListRespEntity?> showDialog(BuildContext context) {
    Completer<HomeCategoryListRespEntity?> completer = Completer();
    super
        .show<int?>(context, isDismissible: true, isScrollControlled: true)
        .then((value) {
      if (selectItem.value == null) {
        completer.complete(null);
      } else {
        completer.complete(selectItem.value);
      }
    }).catchError((error) {
      completer.completeError(error);
    });
    return completer.future;
  }
}
