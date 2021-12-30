import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/function/home/api/home_api.dart';
import 'package:meng_guo/function/home/entity/home_list_req_entity.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:menghabit/tool/base/extensions/collections_extension.dart';
import 'package:menghabit/tool/base/extensions/language_extension.dart';
import 'package:menghabit/tool/base/paging/base_list_view_model.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/paging/paging_load_callback.dart';
import 'package:meng_guo/net/net_extension.dart';

/// 首页列表 分页
class HomeListTabViewModel
    extends BaseListViewModel<BaseModel, HomeListItemViewModel> {
  final String title;
  final int categoryId;

  /// 滚动位置记录
  Key? _pageListKey;

  Key get pageListKey {
    _pageListKey ??= PageStorageKey("HomeListTab_$categoryId");
    return _pageListKey!;
  }

  HomeListTabViewModel(BaseModel model, this.title, this.categoryId)
      : super(model);

  bool hasLoaded = false;

  HomeListReqEntity _reqEntity = HomeListReqEntity();

  @override
  void loadData(
      int pageIndex, LoadCallback<HomeListItemViewModel> loadCallback) {
    launch(() async {
      final result = await getHomeList(categoryId, _reqEntity, pageIndex);
      final data = result.pageData;

      final list = data?.orEmptyList().map(
        (e) {
          return HomeListContentItemViewModel(e);
        },
      ).toList();

      int totalPages = 0;
      if (data.orEmptyList().length == 0) {
        totalPages = pageIndex;
      } else {
        totalPages = pageIndex + 1;
      }
      loadCallback.onSuccess(list.orEmptyList(), pageIndex, totalPages);
    }, (err) {
      loadCallback.onFailure();
    });
  }

  Future<HomeListRespEntity> getHomeList(
      int categoryId, HomeListReqEntity reqEntity, int pageNo) {
    reqEntity.page = pageNo;
    String api = '';
    if (categoryId == -1) {
      api = HomeApi.HOME_TAB_LIST;
    } else {
      api = '${HomeApi.HOME_TAB_LIST}?filter[categoryids][0]=$categoryId';
    }
    return model
        .request<HomeListRespEntity>(
          api,
          queryParameters: reqEntity.toJson(),
          isPost: false,
        )
        .check();
  }

  @override
  bool enableRefresh() {
    return false;
  }

  void reload() {
    if (hasLoaded) refresh();
  }

  @override
  void showEmpty() {
    setEmptyState(
      EmptyState.EMPTY,
      title: getLanguage<S>().common_empty_data,
      icon: "assets/images/default_no_data.png",
      resPackage: 'menghabit',
    );
  }
}
