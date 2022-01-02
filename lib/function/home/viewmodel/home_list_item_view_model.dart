import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:menghabit/menghabit.dart';

/// 列表Item
class HomeListItemViewModel extends ChangeNotifier {
  final HomeListDataEntity entity;

  HomeListItemViewModel(this.entity);
}

/// 账单列表内容Item
class HomeListContentItemViewModel extends HomeListItemViewModel {
  /// icon
  String userIcon = '';

  /// 用户名
  String userName = '';

  /// 标题
  String title = '';

  /// 内容
  String content = '';

  String? imageUrl;

  String likeCount = '';
  String commentCount = '';
  List<String> tags = [];
  int threadId = 0;
  bool isAds = false;

  HomeListContentItemViewModel(
    HomeListDataEntity entity,
  ) : super(entity) {
    threadId = entity.threadId ?? 0;
    isAds = entity.isAds ?? false;
    userIcon = entity.user?.avatar ?? '';
    userName = entity.user?.nickname ?? '';
    title = entity.title ?? '';
    content = _parseHtmlString(entity.content?.text ?? '');
    commentCount = '${entity.likeReward?.likePayCount ?? 0}';
    likeCount = '${entity.likeReward?.postCount ?? 0}';
    if (entity.content?.tags?.orEmptyList() != null) {
      // tags = entity.content!.tags!;
      final list = entity.content!.tags!.map((e) {
        return _parseHtmlString(e);
      });
      tags
        ..clear()
        ..addAll(list);
    }

    /// 列表图
    if (entity.content?.indexes != null) {
      final imagesObject = entity.content!.indexes;
      if (imagesObject is Map<String, dynamic>) {
        final body = imagesObject["101"]["body"];
        if (body is List) {
          final img = body.orEmptyList().first["url"];
          imageUrl = img;
        }
      }
    }
  }

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    return document.body?.text ?? '';
  }

  /// 获取类型返回不同标题 ///类型 1.支付收益 2.余额提现 3.退款
  // String _getBillsTypeTitle(int? type) {
  //   switch (type) {
  //     case BillsEntityConstant.ASSET_INCOME: // 支付收益
  //       return getLanguage<S>().bills_list_pay_income;
  //     case BillsEntityConstant.ASSET_WITHDRAWAL: // 余额提现
  //       return getLanguage<S>().withdrawal_balance_title;
  //     case BillsEntityConstant.ASSET_REFUND: // 退款
  //       return getLanguage<S>().bills_list_refund;
  //     default:
  //       return '';
  //   }
  // }

  /// 获取类型返回不同icon ///类型 1.支付收益 2.余额提现 3.退款
  // String _getBillsType(int? type) {
  //   switch (type) {
  //     case BillsEntityConstant.ASSET_INCOME: // 支付收益
  //     // return getLanguage<S>().order_status_unpaid;
  //       return 'assets/images/home/bills_pay_income.png';
  //     case BillsEntityConstant.ASSET_WITHDRAWAL: // 余额提现
  //       return 'assets/images/home/bills_balance_withdrawal.png';
  //     case BillsEntityConstant.ASSET_REFUND: // 退款
  //       return 'assets/images/home/bills_refund.png';
  //     default:
  //       return '';
  //   }
  // }
}
