import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/login/entity/register_req_entity.dart';
import 'package:meng_guo/function/login/entity/register_resp_entity.dart';
import 'package:meng_guo/function/login/model/login_model.dart';
import 'package:meng_guo/generated/l10n.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/keyboard_utils.dart';
import 'package:menghabit/tool/utils/toast_utils.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';

class RegisterViewModel extends BaseViewModel<LoginModel> {
  late BuildContext _context;

  final formKey = GlobalKey<FormState>();

  final TextEditingController userController = TextEditingController();

  final TextEditingController pwdController = TextEditingController();

  final TextEditingController confirmPwdController = TextEditingController();

  final TextEditingController nickNameController = TextEditingController();

  ValueNotifier<bool> canRegister = ValueNotifier(false);

  RegisterReqEntity reqEntity = RegisterReqEntity();

  RegisterViewModel(LoginModel model) : super(model);

  void initialise(BuildContext context) async {
    _context = context;
    // globalBgColor.value = color_FFF7F9FA;
    setAppBarShow(false)
        .setShowAppBarBackIcon(false)
        .setAppBarTitle(getLanguage<S>().common_tab_message)
        .setAppBarBackIconColor(Colors.black)
        .setAppBarTitleColor(color_FF030319)
        .setAppBarBgColor(Colors.white)
        .setAppbarTitleSize(20.px)
        .setAppBarTitleWeight(FontWeight.w600);
  }

  void register() {
    KeyboardUtils.hideByContext(_context);
    if (reqEntity.username == null) {
      ToastUtils.showShort('请输入用户名！');
      return;
    }
    if (reqEntity.password == null) {
      ToastUtils.showShort('请输入密码！');
      return;
    }
    if (reqEntity.password!.length < 6) {
      ToastUtils.showShort('密码至少需要6位！');
      return;
    }
    if (reqEntity.passwordConfirmation == null) {
      ToastUtils.showShort('请输入确认密码！');
      return;
    }
    if (reqEntity.passwordConfirmation != reqEntity.password) {
      ToastUtils.showShort('密码输入不一致，请重新输入!');
      return;
    }
    if (!reqEntity.isCheckAgreement) {
      ToastUtils.showShort('请勾选协议！');
      return;
    }
    launch(() async {
      showLoadingDialog();
      RegisterRespEntity result = await model.register(reqEntity);
      dismissLoadingDialog();
      ToastUtils.showShort('注册成功!');
      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.pop(_context);
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
