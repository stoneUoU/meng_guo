import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:meng_guo/function/home/model/home_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_tab_view_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:meng_guo/storage/emoji_storage.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/list_notifier.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class HomeViewModel extends BaseViewModel<HomeModel> {
  late BuildContext _context;

  /// 当前选中tab
  final pageTabIndex = ValueNotifier(0);

  /// 账单类型列表
  // final billsTypeList = ListNotifier<BillsListTypeViewModel>();

  /// 订单状态分类
  final pageTabViewModelList = ListNotifier<HomeListTabViewModel>();

  List<EmojiListRespEntity>? emojiList = EmojiStorage.getEmojis();

  ValueNotifier<DateTimeRange> dateRange = ValueNotifier(DateTimeRange(
      start: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 6),
      end: DateTime.now()));

  HomeViewModel(HomeModel model) : super(model);

  void initialise(BuildContext context) async {
    _context = context;
    globalBgColor.value = Colors.white;
    setAppBarShow(true)
        .setShowAppBarBackIcon(false)
        .setAppBarTitle(getLanguage<S>().common_tab_home)
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
    // loadData();
    getData();
  }

  void getData() {
    mState = EmptyState.PROGRESS;
    pageTabViewModelList.clear();
    launch(() async {
      final result = await model.getHomeCategoryTabList();
      if (emojiList == null) {
        final emojiList = await model.getEmojiList();
        EmojiStorage.putEmojis(emojiList.orEmptyList());
      }

      final list = result.map((e) {
        return HomeListTabViewModel(
          BaseModel(),
          e.name ?? '',
          e.categoryId ?? 1,
        );
      }).toList();
      pageTabViewModelList.add(
        HomeListTabViewModel(BaseModel(), '全部', -1),
      );
      pageTabViewModelList.addAll(list);

      mState = EmptyState.NORMAL;
    }, (err) {
      mState = EmptyState.NET_ERROR;
    });
  }

  @override
  void onReloadData() {
    super.onReloadData();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
