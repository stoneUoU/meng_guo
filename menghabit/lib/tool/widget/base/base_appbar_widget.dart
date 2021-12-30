import 'package:flutter/material.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final BaseViewModel appBarProperty;

  AppBarWidget(this.appBarProperty);

  @override
  Widget build(BuildContext context) {
    return ValueListenableListBuilder(
      valueListenables: [
        appBarProperty.appBarTitle,
        appBarProperty.appBarShowBackIcon,
        appBarProperty.appBarIsCloseIcon,
        appBarProperty.appBarBackIconColor,
        appBarProperty.appBarTitleColor,
        appBarProperty.appBarTitleSize,
        appBarProperty.appBarBgColor,
        appBarProperty.appBarBrightness,
        // appBarProperty.appBarLeadingCallBack
      ],
      builder: (context, value, child) {
        return AppBar(
          // brightness: appBarProperty.appBarBrightness.value,
          systemOverlayStyle: appBarProperty.appBarBrightness.value,
          backgroundColor: appBarProperty.appBarBgColor.value,
          elevation: 0.3,
          centerTitle: true,
          title: Text(
            appBarProperty.appBarTitle.value,
            style: TextStyle(
              fontSize: appBarProperty.appBarTitleSize.value,
              color: appBarProperty.appBarTitleColor.value,
              fontWeight: appBarProperty.appBarTitleWeight.value,
            ),
          ),
          leadingWidth: 58.px,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: appBarProperty.appBarShowBackIcon.value,
                child: Material(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.px))),
                  child:
                      // IconButton(
                      //     padding: EdgeInsets.zero,
                      //     onPressed: () {
                      //       ///执行默认的返回按钮
                      //       if (appBarProperty.appBarLeadingCallBack == null) {
                      //         Navigator.pop(context);
                      //       } else {
                      //         appBarProperty.appBarLeadingCallBack!.call();
                      //       }
                      //     },
                      //     icon: new
                      GestureDetector(
                    onTap: () {
                      ///执行默认的返回按钮
                      if (appBarProperty.appBarLeadingCallBack == null) {
                        Navigator.pop(context);
                      } else {
                        appBarProperty.appBarLeadingCallBack!.call();
                      }
                    },
                    child: Image.asset(
                      appBarProperty.appBarIsCloseIcon.value
                          ? 'assets/images/common_close.png'
                          : 'assets/images/default_ic_back_black.png',
                      package: 'menghabit',
                      color: appBarProperty.appBarBackIconColor.value,
                      width: 40.px,
                      height: 40.px,
                    ),
                  ),
                  // ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
