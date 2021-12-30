import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/my/model/my_draft_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:menghabit/tool/base/extensions/language_extension.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class MyDraftViewModel extends BaseViewModel<MyDraftModel> {
  late BuildContext _context;

  ValueNotifier<String> headUrl = ValueNotifier('');

  MyDraftViewModel(MyDraftModel model) : super(model);

  void initialise(BuildContext context) async {
    _context = context;
    setAppBarShow(false)
        .setShowAppBarBackIcon(false)
        .setAppBarTitle(getLanguage<S>().common_tab_my)
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
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
