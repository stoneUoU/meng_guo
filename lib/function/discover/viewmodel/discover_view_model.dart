import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/discover/model/discover_model.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class DiscoverViewModel extends BaseViewModel<DiscoverModel> {
  late BuildContext _context;

  ValueNotifier<List<String>> items = ValueNotifier([]);

  ValueNotifier<List<HomeListContentItemViewModel>?> hotList =
      ValueNotifier(null);

  DiscoverViewModel(DiscoverModel model) : super(model);

  void initialise(BuildContext context) async {
    _context = context;
    // globalBgColor.value = color_FFF7F9FA;
    setAppBarShow(true)
        .setShowAppBarBackIcon(false)
        .setAppBarTitle('发现')
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
    getData();
  }

  void getData() {
    mState = EmptyState.PROGRESS;
    launch(() async {
      final result = await model.getDiscoverTopTipList();
      final hotData = await model.getDiscoverHotList();

      final hotLists = hotData.pageData.orEmptyList().map(
        (e) {
          return HomeListContentItemViewModel(e);
        },
      ).toList();
      hotList.value = hotLists;

      final list = result.pageData?.orEmptyList().map((e) {
        return e.content ?? '';
      }).toList();
      items.value = list.orEmptyList();
      mState = EmptyState.NORMAL;
    }, (err) {
      mState = EmptyState.NET_ERROR;
    });
  }

  @override
  void onReloadData() {
    super.onReloadData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
