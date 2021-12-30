import 'package:flutter/material.dart';
import 'package:meng_guo/function/publish/entity/publish_toptip_search_resp_entity.dart';
import 'package:meng_guo/function/publish/model/publish_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class PublishTopTipViewModel extends BaseViewModel<PublishModel> {
  late BuildContext _context;

  ValueNotifier<List<TopTipPageEntity>?> searchResult = ValueNotifier(null);

  PublishTopTipViewModel(PublishModel model) : super(model);

  void initialise(BuildContext context) {
    _context = context;
    // this.threadId = threadId;
    // globalBgColor.value = color_FFF7F9FA;
    setAppBarShow(false);
    // getData(threadId);
    // getData();
  }

  void search(String content) {
    if (content.isEmpty) {
      return;
    }

    launch(() async {
      showLoadingDialog();
      final result = await model.searchTopTipsList(content);
      // if (result.isNewTopic == true) {
      //   searchResult.value = [TopTipPageEntity()..content = content];
      // } else {
      searchResult.value = result.pageData;
      // }

      dismissLoadingDialog();
    }, (err) {
      dismissLoadingDialog();
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
