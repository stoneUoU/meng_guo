import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_unionad/flutter_unionad.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/tabbar/common_tabbar_indicator.dart';
import 'package:meng_guo/common/widget/tabbar/scale_tabbar.dart';
import 'package:meng_guo/function/detail/page/detail_page.dart';
import 'package:meng_guo/function/home/item/home_common_list_item.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_tab_view_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/paging/base_list_widget.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

typedef void HomeListTabListener(HomeListContentItemViewModel viewModel);

/// 列表 分页指示器
class HomeListTab extends StatefulWidget {
  final HomeViewModel viewModel;

  HomeListTab({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  _HomeListTabState createState() => _HomeListTabState();
}

class _HomeListTabState extends State<HomeListTab>
    with SingleTickerProviderStateMixin {
  HomeViewModel get viewModel => widget.viewModel;

  late TabController _tabController;
  StreamSubscription? _adViewStream;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewModel.pageTabIndex.value,
      length: viewModel.pageTabViewModelList.length,
      vsync: this,
    );
    viewModel.pageTabIndex.addListener(_changeIndex);
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
    _tabController.dispose();
    viewModel.pageTabIndex.removeListener(_changeIndex);
    super.dispose();
    if (_adViewStream != null) {
      _adViewStream?.cancel();
    }
  }

  void _changeIndex() {
    _tabController.index = viewModel.pageTabIndex.value;
  }

  @override
  Widget build(BuildContext context) {
    this._fetchFullScreenVideoAd();
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 47.px,
          padding: EdgeInsets.symmetric(horizontal: 4.px),
          child: Row(
            children: [
              Expanded(
                child: ScaleTabBar(
                  controller: _tabController,
                  unselectedLabelColor: color_FF999999,
                  unselectedLabelStyle: TextStyle(
                      fontSize: 16.px,
                      color: color_FF8F92A1,
                      fontWeight: FontWeight.w400),
                  labelColor: color_FF4A9BF7,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 12.px),
                  labelStyle: TextStyle(
                      fontSize: 16.px,
                      color: color_FF333333,
                      fontWeight: FontWeight.w500),
                  indicator: CommonUnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0, color: color_FF4A9BF7),
                      indicatorWidth: 24.px),
                  onTap: (index) {
                    viewModel.pageTabIndex.value = index;
                  },
                  tabs: List.generate(
                    viewModel.pageTabViewModelList.length,
                    (index) {
                      return Text(viewModel.pageTabViewModelList[index].title);
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/home/home_search.png',
                  width: 15.px,
                  height: 15.px,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: viewModel.pageTabViewModelList
                .map(
                  (e) => HomeListTabPage(
                    viewModel: e,
                    homeListTabListener:
                        (HomeListContentItemViewModel viewModel) {
                      Navigator.pushNamed(context, DetailPage.sName,
                          arguments: viewModel.threadId);
                    },
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
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
  }
}

/// 列表 分页
class HomeListTabPage extends StatelessWidget {
  final HomeListTabViewModel viewModel;
  final HomeListTabListener homeListTabListener;
  const HomeListTabPage({
    Key? key,
    required this.viewModel,
    required this.homeListTabListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChildViewModelProvider<HomeViewModel, HomeListTabViewModel>(
      changeViewModel: (context, parent, viewModel, oldViewModel) {
        viewModel.setAppBarShow(false);
      },
      create: (context, parent) => viewModel,
      builder: (context, parent, viewModel, child) => BaseScaffold(
        viewModel: viewModel,
        body: Container(
          color: color_FFF5F5F5,
          child: VvListView<HomeListTabViewModel>(
            key: viewModel.pageListKey,
            footerBottom: 88.px,
            builder: (context, index) {
              final item = viewModel.items[index];
              Widget widget;
              if (item is HomeListContentItemViewModel) {
                widget = HomeCommonListItem(
                  index: index,
                  viewModel: item,
                  onHomeCommonListItemListener: () {
                    if (this.homeListTabListener != null) {
                      this.homeListTabListener(item);
                    }
                  },
                );
              } else {
                widget = SizedBox();
              }
              return widget;
            },
          ),
        ),
      ),
    );
  }
}
