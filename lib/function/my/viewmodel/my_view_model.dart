import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/config/user_config.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/login/pages/login_page.dart';
import 'package:meng_guo/function/my/model/my_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/list_notifier.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class MyViewModel extends BaseViewModel<MyModel> {
  late BuildContext _context;

  // List<String> topItems = ['获赞', '关注', '粉丝'];

  ListNotifier<MyItemsData> topItems = ListNotifier([]);

  LoginRespEntity? user;

  ValueNotifier<bool> isLogin = ValueNotifier(false);

  ValueNotifier<List<HomeListContentItemViewModel>?> myList =
      ValueNotifier(null);

  ValueNotifier<int> listCount = ValueNotifier(0);

  /// 头像
  ValueNotifier<String> headUrl = ValueNotifier('');

  ///昵称
  ValueNotifier<String> nickName = ValueNotifier('');

  ///获赞
  ValueNotifier<String> likeCount = ValueNotifier('');

  ///关注
  ValueNotifier<String> attentionCount = ValueNotifier('');

  ///粉丝
  ValueNotifier<String> followCount = ValueNotifier('');

  /// 签名
  ValueNotifier<String> sign = ValueNotifier('');

  MyViewModel(MyModel model) : super(model);

  void initialise(BuildContext context) async {
    _context = context;

    user = UserStorage.getUser();

    setAppBarShow(false)
        .setShowAppBarBackIcon(false)
        .setAppBarTitle(getLanguage<S>().common_tab_my)
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
    isLogin.value = user != null;
    // logout();
    if (isLogin.value) {
      user = UserStorage.getUser();
      getData(user?.userId ?? 0);
    }
  }

  void getData(int userId, {bool isRefresh = false}) {
    launch(() async {
      if (isRefresh) {
        showLoadingDialog();
      } else {
        mState = EmptyState.PROGRESS;
      }
      final result = await model.getMyHome(userId);
      final myData = await model.getMyHomeList();

      headUrl.value = result.avatarUrl ?? '';

      nickName.value = result.nickname ?? '';

      // likeCount.value = result.likedCount.toString();

      sign.value = result.signature.orEmptyString();

      topItems.add(MyItemsData('获赞', result.likedCount.toString()));
      topItems.add(MyItemsData('关注', result.followCount.toString()));
      topItems.add(MyItemsData('粉丝', result.fansCount.toString()));

      // followCount.value = result.followCount.toString();
      // headUrl.value = result.fansCount.toString();

      final hotLists = myData.pageData.orEmptyList().map(
        (e) {
          return HomeListContentItemViewModel(e);
        },
      ).toList();
      myList.value = hotLists;
      listCount.value = hotLists.length;

      if (isRefresh) {
        dismissLoadingDialog();
      } else {
        mState = EmptyState.NORMAL;
      }
    }, (err) {
      if (isRefresh) {
        dismissLoadingDialog();
      } else {
        mState = EmptyState.NET_ERROR;
      }
    });
  }

  /// 测试用
  void logout() {
    UserStorage.removeUser();
    UserConfig.setUserCode(null, null);
    isLogin.value = false;
  }

  void goToLoginPage() {
    Navigator.pushNamed(_context, LoginPage.sName).then((value) {
      if (value != null && value is bool && value == true) {
        isLogin.value = true;
        user = UserStorage.getUser();
        getData(user?.userId ?? 0);
      }
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

class MyItemsData {
  String title;
  String count;

  MyItemsData(this.title, this.count);
}
