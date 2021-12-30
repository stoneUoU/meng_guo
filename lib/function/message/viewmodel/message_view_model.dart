import 'dart:async';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/message/api/message_api.dart';
import 'package:meng_guo/function/message/entity/message_replied_resp_entity.dart';
import 'package:meng_guo/function/message/entity/message_system_resp_entity.dart';
import 'package:meng_guo/function/message/model/message_model.dart';
import 'package:meng_guo/function/message/viewmodel/message_child_view_model.dart';
import 'package:meng_guo/function/message/viewmodel/message_content_view_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:meng_guo/net/net_extension.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/base/repeat_value_notifier.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

enum MessageType {
  system,
  my,
  tip,
}

extension MessageTypeString on MessageType {
  String fetchMessageString() {
    switch (this) {
      case MessageType.my:
        return '我的消息';
      case MessageType.system:
        return '系统消息';
      default:
        return '帖子消息';
    }
  }
}

class MessageViewModel extends BaseViewModel<MessageModel> {
  late BuildContext _context;

  int page = 1;

  /// 子布局信息
  late MessageChildViewModel childViewModel;

  ValueNotifier<MessageType> msgType = ValueNotifier(MessageType.my);

  ValueNotifier<bool> show = ValueNotifier(true);

  /// 数据大小
  RepeatValueNotifier<int> dataCount = RepeatValueNotifier(0);

  /// 数据源
  List<MessageContentItemViewModel> dataList = [];

  /// 控制加载更多
  EasyRefreshController easyRefreshController = EasyRefreshController();

  /// 数据少于1屏，并且没有更多，展示
  ValueNotifier<bool> showFooter = ValueNotifier(false);

  MessageViewModel(MessageModel model) : super(model);

  void initialise(BuildContext context) async {
    _context = context;
    childViewModel = MessageChildViewModel(MessageModel());
    setAppBarShow(true)
        .setShowAppBarBackIcon(false)
        .setAppBarTitle(getLanguage<S>().common_tab_message)
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
    loadData(true);
  }

  void loadData(bool isFirstLoad) {
    if (isFirstLoad) {
      mState = EmptyState.PROGRESS;
    } else {
      childViewModel.showLoading();
    }
    dataList.clear();
    launch(() async {
      if (msgType.value == MessageType.tip) {
        MessageRepliedRespEntity respData = await model.getTipMessage(page);
        final formatList = respData.pageData.orEmptyList().map((e) {
          return MessageContentItemViewModel(null, e);
        }).toList();
        dataList = formatList;
      } else if (msgType.value == MessageType.system) {
        MessageSystemRespEntity respData = await model.getMyMessage(page);
        final formatList = respData.pageData.orEmptyList().map((e) {
          return MessageContentItemViewModel(e, null);
        }).toList();
        dataList = formatList;
      } else {
        dataList = [];
      }
      // dataList = respData.pageData.orEmptyList();

      dataCount.value = dataList.length;

      if (dataList.length < 10) {
        showFooter.value = true;
      } else {
        showFooter.value = false;
      }

      if (isFirstLoad) {
        mState = EmptyState.NORMAL;
      } else {
        childViewModel.showNormal();
      }
      if (dataList.orEmptyList().isEmpty) {
        childViewModel.showEmpty();
      } else {
        childViewModel.showNormal();
      }

      if (dataList.length < 10) {
        easyRefreshController.finishLoad(success: true, noMore: true);
      }
    }, (err) {
      if (isFirstLoad) {
        mState = EmptyState.NET_ERROR;
      } else {
        childViewModel.showNetError();
      }
    });
  }

  Future<void> getStoreList() {
    var completer = Completer();

    page = page + 1;

    launch(() async {
      // MessageSystemRespEntity respData = await model
      //     .request(
      //       MessageApi.MESSAGE_MY.format([page]),
      //       isPost: false,
      //     )
      //     .check();
      int total = 0;
      int currentCount = 0;
      if (msgType.value == MessageType.tip) {
        MessageRepliedRespEntity respData = await model.getTipMessage(page);
        final formatList = respData.pageData.orEmptyList().map((e) {
          return MessageContentItemViewModel(null, e);
        });
        dataList.addAll(formatList);
        currentCount = respData.pageData.orEmptyList().length;
        total = respData.totalCount ?? 0;
      } else if (msgType.value == MessageType.system) {
        MessageSystemRespEntity respData = await model.getMyMessage(page);
        final formatList = respData.pageData.orEmptyList().map((e) {
          return MessageContentItemViewModel(e, null);
        });
        dataList.addAll(formatList);
        currentCount = respData.pageData.orEmptyList().length;
        total = respData.totalCount ?? 0;
      } else {
        dataList = [];
      }

      // dataList.addAll(respData.pageData.orEmptyList());

      /// 第一次没有一屏
      if (dataList.length < 10) {
        showFooter.value = true;
      } else {
        showFooter.value = false;
      }

      if (dataList.orEmptyList().isEmpty) {
        childViewModel.showEmpty();
      } else {
        childViewModel.showNormal();
      }

      dataCount.value = dataList.length;
      if (currentCount < 10 && showFooter.value == false) {
        print('no more');
        easyRefreshController.finishLoad(success: true, noMore: true);
      }
      completer.complete("done");
    }, (err) {
      showNetError();
    });
    return completer.future;
  }

  @override
  void onReloadData() {
    super.onReloadData();
    loadData(true);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
