import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/detail/entity/detail_comment_resp_entity.dart';
import 'package:meng_guo/function/detail/entity/detail_info_resp_entity.dart';
import 'package:meng_guo/function/detail/model/detail_model.dart';
import 'package:meng_guo/function/discover/model/discover_model.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class DetailViewModel extends BaseViewModel<DetailModel> {
  late BuildContext _context;

  ValueNotifier<List<String>> items = ValueNotifier([]);

  ValueNotifier<List<HomeListContentItemViewModel>?> hotList =
      ValueNotifier(null);

  DetailListDataEntity? detailData;

  DetailCommentRespEntity? commentData;

  LoginRespEntity? user = UserStorage.getUser();

  ValueNotifier<List<String>> images = ValueNotifier([]);

  late int threadId;

  DetailViewModel(DetailModel model) : super(model);

  void initialise(BuildContext context, int threadId) async {
    _context = context;
    this.threadId = threadId;
    // globalBgColor.value = color_FFF7F9FA;
    setAppBarShow(true)
        .setShowAppBarBackIcon(true)
        // .setAppBarTitle('发现')
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
    getData(threadId);
  }

  void getData(int threadId) {
    mState = EmptyState.PROGRESS;
    launch(() async {
      detailData = await model.getTopicDetail(threadId);
      commentData = await model.getCommentList(threadId);

      if (detailData?.content?.indexes != null) {
        final imagesObject = detailData?.content?.indexes;
        if (imagesObject is Map<String, dynamic>) {
          final body = imagesObject["101"]["body"];
          if (body is List) {
            // final img = body.orEmptyList().first["url"];
            final imgs = body.orEmptyList().map((e) {
              var img = e["url"];
              if (img is String) {
                // return img;
              } else {
                img = '';
              }
              return img;
            }).toList();
            images.value = imgs;
          }
        }
      }

      // final hotLists = hotData.pageData.orEmptyList().map(
      //   (e) {
      //     return HomeListContentItemViewModel(e);
      //   },
      // ).toList();
      // hotList.value = hotLists;
      //
      // final list = result.pageData?.orEmptyList().map((e) {
      //   return e.content ?? '';
      // }).toList();
      // items.value = list.orEmptyList();
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
