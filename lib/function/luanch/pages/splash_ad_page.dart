import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_unionad/flutter_unionad.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/config/user_config.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/meng_guo_home_index_page.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';

class SplashAdPage extends StatefulWidget {
  static const String sName = "SplashAdPage";

  @override
  _SplashAdPageState createState() => _SplashAdPageState();
}

class _SplashAdPageState extends State<SplashAdPage> {
  bool _offstage = true;
  StreamSubscription? _adViewStream;
  @override
  void initState() {
    super.initState();
    _adViewStream = FlutterUnionadStream.initAdStream(
      flutterUnionadFullVideoCallBack: FlutterUnionadFullVideoCallBack(
        onShow: () {
          print("全屏广告显示");
        },
        onSkip: () {
          print("全屏广告跳过");
        },
        onClick: () {
          print("全屏广告点击");
        },
        onFinish: () {
          print("全屏广告结束");
        },
        onFail: (error) {
          print("全屏广告错误 $error");
        },
        onClose: () {
          print("全屏广告关闭");
        },
      ),
      //插屏广告回调
      flutterUnionadInteractionCallBack: FlutterUnionadInteractionCallBack(
        onShow: () {
          print("插屏广告展示");
        },
        onClose: () {
          print("插屏广告关闭");
        },
        onFail: (error) {
          print("插屏广告失败 $error");
        },
        onClick: () {
          print("插屏广告点击");
        },
        onDislike: (message) {
          print("插屏广告不喜欢  $message");
        },
      ),
      // 新模板渲染插屏广告回调
      flutterUnionadNewInteractionCallBack:
          FlutterUnionadNewInteractionCallBack(
        onShow: () {
          print("新模板渲染插屏广告显示");
        },
        onSkip: () {
          print("新模板渲染插屏广告跳过");
        },
        onClick: () {
          print("新模板渲染插屏广告点击");
        },
        onFinish: () {
          print("新模板渲染插屏广告结束");
        },
        onFail: (error) {
          print("新模板渲染插屏广告错误 $error");
        },
        onClose: () {
          print("新模板渲染插屏广告关闭");
        },
        onReady: () async {
          print("新模板渲染插屏广告预加载准备就绪");
          //显示新模板渲染插屏
          await FlutterUnionad.showFullScreenVideoAdInteraction();
        },
        onUnReady: () {
          print("新模板渲染插屏广告预加载未准备就绪");
        },
      ),
      //激励广告
      flutterUnionadRewardAdCallBack: FlutterUnionadRewardAdCallBack(
        onShow: () {
          print("激励广告显示");
        },
        onClick: () {
          print("激励广告点击");
        },
        onFail: (error) {
          print("激励广告失败 $error");
        },
        onClose: () {
          print("激励广告关闭");
        },
        onSkip: () {
          print("激励广告跳过");
        },
        onReady: () async {
          print("激励广告预加载准备就绪");
          await FlutterUnionad.showRewardVideoAd();
        },
        onUnReady: () {
          print("激励广告预加载未准备就绪");
        },
        onVerify: (rewardVerify, rewardAmount, rewardName, errorCode, error) {
          print(
              "激励广告奖励  验证结果=$rewardVerify 奖励=$rewardAmount  奖励名称$rewardName 错误吗=$errorCode 错误$error");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Offstage(
          offstage: _offstage,
          child: FlutterUnionad.splashAdView(
            //是否使用个性化模版  设定widget宽高
            mIsExpress: true,
            //android 开屏广告广告id 必填
            androidCodeId: "887661840",
            //ios 开屏广告广告id 必填
            iosCodeId: "887661329",
            //是否支持 DeepLink 选填
            supportDeepLink: true,
            // 期望view 宽度 dp 选填 mIsExpress=true必填
            expressViewWidth: ScreenUtils.screenW(),
            //期望view高度 dp 选填 mIsExpress=true必填
            expressViewHeight: ScreenUtils.screenH(),
            //控制下载APP前是否弹出二次确认弹窗
            downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
            callBack: FlutterUnionadSplashCallBack(
              onShow: () {
                print("开屏广告显示");
                setState(() => _offstage = false);
              },
              onClick: () {
                print("开屏广告点击");
                _fetchHomePage(context);
              },
              onFail: (error) {
                print("开屏广告失败 $error");
                _fetchHomePage(context);
              },
              onFinish: () {
                print("开屏广告倒计时结束");
                _fetchHomePage(context);
              },
              onSkip: () {
                print("开屏广告跳过");
                _fetchHomePage(context);
              },
              onTimeOut: () {
                print("开屏广告超时");
                _fetchHomePage(context);
              },
            ),
          ),
        ),
        Expanded(
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
                      borderRadius:
                          BorderRadius.all(new Radius.circular(6.0.px)),
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
        )
      ],
    );
  }

  _fetchHomePage(BuildContext context) {
    LoginRespEntity? user = UserStorage.getUser();
    if (user != null) {
      UserConfig.setUserCode(
          user.userId, '${user.tokenType} ${user.accessToken}');
    }
    Navigator.pushNamed(context, MengGuoHomeIndexPage.sName);
  }

  @override
  void dispose() {
    super.dispose();
    if (_adViewStream != null) {
      _adViewStream?.cancel();
    }
  }
}
