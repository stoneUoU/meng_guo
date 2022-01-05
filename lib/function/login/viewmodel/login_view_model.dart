import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/config/user_config.dart';
import 'package:meng_guo/function/login/entity/login_req_entity.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/login/model/login_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/toast_utils.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';
import 'package:menghabit/tool/widget/keyboard_utils.dart';

class LoginViewModel extends BaseViewModel<LoginModel> {
  late BuildContext _context;

  TextEditingController userNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  LoginReqEntity reqEntity = LoginReqEntity();

  LoginViewModel(LoginModel model) : super(model);

  void initialise(BuildContext context) async {
    _context = context;
    setAppBarShow(false)
        .setShowAppBarBackIcon(false)
        .setAppBarTitle(getLanguage<S>().common_tab_message)
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
  }

  void login() {
    KeyboardUtils.hideByContext(_context);
    if (reqEntity.username == null) {
      ToastUtils.showShort('请输入用户名！');
      return;
    }
    if (reqEntity.password == null) {
      ToastUtils.showShort('请输入密码！');
      return;
    }
    if (!reqEntity.isCheckAgreement) {
      ToastUtils.showShort('请勾选协议！');
      return;
    }
    late LoginRespEntity respResults;
    launch(() async {
      showLoadingDialog();
      respResults = await model.login(reqEntity);
      dismissLoadingDialog();
      UserStorage.putUser(respResults);
      UserConfig.setUserCode(respResults.userId,
          '${respResults.tokenType} ${respResults.accessToken}');
      ToastUtils.showShort('登录成功！');
      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.pop(_context, true);
      });
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
