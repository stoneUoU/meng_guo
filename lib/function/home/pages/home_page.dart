import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_unionad/flutter_unionad.dart';
import 'package:meng_guo/function/home/model/home_model.dart';
import 'package:meng_guo/function/home/pages/home_list_tab_page.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_tab_view_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_view_model.dart';
import 'package:meng_guo/router/router_lifecycle_widget.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class HomePage extends StatelessWidget {
  static const String sName = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      create: (context) => HomeViewModel(HomeModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<HomeViewModel>(
          viewModel: viewModel,
          body: _HomeListView(viewModel: viewModel),
        );
      },
    );
  }
}

class _HomeListView extends StatefulWidget {
  final HomeViewModel viewModel;
  const _HomeListView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<_HomeListView>
    with AutomaticKeepAliveClientMixin {
  HomeViewModel get viewModel => widget.viewModel;
  StreamSubscription? _adViewStream;
  bool isAds = false;
  @override
  void initState() {
    // TODO: implement initState
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
  void dispose() {
    super.dispose();
    if (_adViewStream != null) {
      _adViewStream?.cancel();
    }
  }

  void _fetchFullScreenVideoAd() {
    FlutterUnionad.loadFullScreenVideoAdInteraction(
      //android 全屏广告id 必填
      androidCodeId: "947542724",
      //ios 全屏广告id 必填
      iosCodeId: "947542828",
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      //视屏方向 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
      //控制下载APP前是否弹出二次确认弹窗
      downloadType: FlutterUnionadDownLoadType.DOWNLOAD_TYPE_POPUP,
    );
    this.isAds = true;
  }

  @override
  Widget build(BuildContext context) {
    // if (!this.isAds) {
    //   this._fetchFullScreenVideoAd();
    // }
    return RouterLifeCycleWidget(onResume: () {
      Future.delayed(Duration(milliseconds: 500), () {
        viewModel.getData();
      });
    }, builder: (context, child) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: ListListenableBuilder<HomeListTabViewModel>(
          listListenable: viewModel.pageTabViewModelList,
          builder: (context, value, child) {
            return HomeListTab(viewModel: viewModel);
          },
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
