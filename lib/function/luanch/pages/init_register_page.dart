import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/luanch/pages/splash_ad_page.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';

class InitRegisterPage extends StatelessWidget {
  static const String sName = "InitRegisterPage";
  @override
  Widget build(BuildContext context) {
    this._futureSplashAdPage(context);
    return Expanded(
      child: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 164),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(new Radius.circular(6.0.px)),
                  child: Image.asset('assets/images/common/app_logo.png'),
                ),
                width: 36.px,
                height: 36.px,
                margin: EdgeInsets.only(right: 16),
              ),
              Text(
                " 萌果资讯",
                style: TextStyle(
                  fontSize: 40,
                  color: color_FF4272e0,
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _futureSplashAdPage(BuildContext context) {
    print("SplashAdPage");
    Future.delayed(const Duration(milliseconds: 500), () {
      _fetchSplashAdPage(context);
    });
  }

  _fetchSplashAdPage(BuildContext context) {
    Navigator.pushNamed(context, SplashAdPage.sName);
  }
}
