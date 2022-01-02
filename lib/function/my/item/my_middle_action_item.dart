import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_icon_text_button.dart';
import 'package:meng_guo/function/my/pages/my_draft_page.dart';
import 'package:meng_guo/function/my/pages/my_message_page.dart';
import 'package:meng_guo/function/my/pages/my_setting_page.dart';
import 'package:meng_guo/function/my/pages/my_store_page.dart';
import 'package:meng_guo/function/my/viewmodel/my_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class MyMiddleActionItem extends StatelessWidget {
  const MyMiddleActionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyViewModel viewModel = context.viewModel<MyViewModel>();

    return Container(
      padding: EdgeInsets.all(15.px),
      height: 105.px,
      color: color_FFF6F5F8,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.px),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.px),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: (ScreenUtils.screenW() - 60.px) / 4,
                child: CommonIconTextButton(
                  onTap: () {
                    Navigator.pushNamed(context, MyMessagePage.sName);
                  },
                  title: '我的消息',
                  imagePosition: ButtonImagePosition.top,
                  imageName: 'assets/images/my/my_message_icon.png',
                  imageSize: Size(26.px, 26.px),
                  padding: 12.px,
                  textStyle: TextStyle(
                      fontSize: 13.px,
                      color: color_FF616470,
                      fontWeight: FontWeight.w400),
                )),
            Container(
                width: (ScreenUtils.screenW() - 60.px) / 4,
                child: CommonIconTextButton(
                  onTap: () {
                    Navigator.pushNamed(context, MyStorePage.sName);
                  },
                  title: '我的收藏',
                  imagePosition: ButtonImagePosition.top,
                  imageName: 'assets/images/my/my_collect_icon.png',
                  imageSize: Size(26.px, 26.px),
                  padding: 12.px,
                  textStyle: TextStyle(
                      fontSize: 13.px,
                      color: color_FF616470,
                      fontWeight: FontWeight.w400),
                )),
            Container(
                width: (ScreenUtils.screenW() - 60.px) / 4,
                child: CommonIconTextButton(
                  onTap: () {
                    Navigator.pushNamed(context, MyDraftPage.sName);
                  },
                  title: '  草稿箱 ',
                  imagePosition: ButtonImagePosition.top,
                  imageName: 'assets/images/my/my_draft.png',
                  imageSize: Size(26.px, 26.px),
                  padding: 12.px,
                  textStyle: TextStyle(
                      fontSize: 13.px,
                      color: color_FF616470,
                      fontWeight: FontWeight.w400),
                )),
            Container(
                width: (ScreenUtils.screenW() - 60.px) / 4,
                child: CommonIconTextButton(
                  onTap: () {
                    Navigator.pushNamed(context, MySettingPage.sName,
                        arguments: viewModel);
                    // viewModel.logout();
                  },
                  title: '  设置  ',
                  imagePosition: ButtonImagePosition.top,
                  imageName: 'assets/images/my/my_setting.png',
                  imageSize: Size(26.px, 26.px),
                  padding: 12.px,
                  textStyle: TextStyle(
                      fontSize: 13.px,
                      color: color_FF616470,
                      fontWeight: FontWeight.w400),
                )),
          ],
        ),
      ),
    );
  }
}
