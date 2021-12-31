import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_unionad/flutter_unionad.dart';
import 'package:flutter_unionad/flutter_unionad_stream.dart';

import 'banner_page.dart';
import 'drawfeed_page.dart';
import 'nativeexpressad_page.dart';
import 'splash_page.dart';

class AdPage extends StatefulWidget {
  static const String sName = "AdPagePage";

  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterUnionad example app'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //请求权限
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('请求权限'),
              onPressed: () async {
                FlutterUnionad.requestPermissionIfNecessary(
                  callBack: FlutterUnionadPermissionCallBack(
                    notDetermined: () {
                      print("权限未确定");
                    },
                    restricted: () {
                      print("权限限制");
                    },
                    denied: () {
                      print("权限拒绝");
                    },
                    authorized: () {
                      print("权限同意");
                    },
                  ),
                );
              },
            ),
            //banner广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('banner广告'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new BannerPage(),
                  ),
                );
              },
            ),
            //开屏广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('开屏广告'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new SplashPage(),
                  ),
                );
              },
            ),
            //个性化模板信息流广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('信息流广告'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new NativeExpressAdPage(),
                  ),
                );
              },
            ),
            //插屏广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('插屏广告'),
              onPressed: () async {
                await FlutterUnionad.interactionAd(
                  androidCodeId: "945417892",
                  //andrrid 插屏广告id 必填
                  iosCodeId: "945417892",
                  //ios 插屏广告id 必填
                  supportDeepLink: true,
                  //是否支持 DeepLink 选填
                  expressViewWidth: 300.0,
                  // 期望view 宽度 dp 必填
                  expressViewHeight: 450.0,
                  //期望view高度 dp 必填
                  expressNum: 2, //一次请求广告数量 大于1小于3 必填
                  //控制下载APP前是否弹出二次确认弹窗
                  downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
                );
              },
            ),
            //激励视频
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('激励视频'),
              onPressed: () {
                FlutterUnionad.loadRewardVideoAd(
                  mIsExpress: true,
                  //是否个性化 选填
                  androidCodeId: "945418088",
                  //Android 激励视频广告id  必填
                  iosCodeId: "945418088",
                  //ios 激励视频广告id  必填
                  supportDeepLink: true,
                  //是否支持 DeepLink 选填
                  rewardName: "200金币",
                  //奖励名称 选填
                  rewardAmount: 200,
                  //奖励数量 选填
                  userID: "123",
                  //  用户id 选填
                  orientation: FlutterUnionadOrientation.VERTICAL,
                  //控制下载APP前是否弹出二次确认弹窗
                  downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
                  //视屏方向 选填
                  mediaExtra: null, //扩展参数 选填
                );
              },
            ),
            //个性化模板draw广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('draw视频广告'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new DrawFeedPage(),
                  ),
                );
              },
            ),
            //个性化全屏广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('全屏广告'),
              onPressed: () {
                FlutterUnionad.fullScreenVideoAd(
                  androidCodeId: "945491318",
                  //android 全屏广告id 必填
                  iosCodeId: "945491318",
                  //ios 全屏广告id 必填
                  supportDeepLink: true,
                  //是否支持 DeepLink 选填
                  orientation: FlutterUnionadOrientation.VERTICAL,
                  //视屏方向 选填
                  //控制下载APP前是否弹出二次确认弹窗
                  downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
                );
              },
            ),
            //新模板渲染插屏广告
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('新模板渲染插屏广告'),
              onPressed: () {
                FlutterUnionad.loadFullScreenVideoAdInteraction(
                  //android 全屏广告id 必填
                  androidCodeId: "947542724",
                  //ios 全屏广告id 必填
                  iosCodeId: "947542724",
                  //是否支持 DeepLink 选填
                  supportDeepLink: true,
                  //视屏方向 选填
                  orientation: FlutterUnionadOrientation.VERTICAL,
                  //控制下载APP前是否弹出二次确认弹窗
                  downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_adViewStream != null) {
      _adViewStream?.cancel();
    }
  }
}
