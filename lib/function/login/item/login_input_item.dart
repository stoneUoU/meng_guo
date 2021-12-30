import 'package:flutter/services.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_cycle_button.dart';
import 'package:meng_guo/common/widget/common_text_field.dart';
import 'package:meng_guo/function/login/viewmodel/login_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class LoginInputItem extends StatefulWidget {
  const LoginInputItem({Key? key}) : super(key: key);

  @override
  _LoginInputItemState createState() => _LoginInputItemState();
}

class _LoginInputItemState extends State<LoginInputItem> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = context.viewModel<LoginViewModel>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.px),
      margin: EdgeInsets.only(top: 65.px),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.px),
            decoration: BoxDecoration(
              color: color_FFF9F9F9,
              borderRadius: BorderRadius.all(
                Radius.circular(21.px),
              ),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/login/login_username_icon.png')
                    .paddingRight(7.px),
                Expanded(
                  child: CommonTextField(
                    inputCallBack: (value) {
                      viewModel.reqEntity.username = value;
                    },
                    focusNode: FocusNode(),
                    editingController: viewModel.userNameController,
                    contentPadding: EdgeInsets.only(bottom: 16.px, top: 16.px),
                    keyboardType: TextInputType.visiblePassword,
                    validation: (input) {},
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    showClearButton: true,
                    placeholder: '请输入用户名',
                    placeholderStyle: TextStyle(
                        color: color_FF8F92A1, fontSize: 14.px, height: 1),
                    testStyle: TextStyle(fontSize: 14.px),
                  ),
                ),
              ],
            ),
          ).marginBottom(15.px),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.px),
            decoration: BoxDecoration(
              color: color_FFF9F9F9,
              borderRadius: BorderRadius.all(
                Radius.circular(21.px),
              ),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/login/login_password_icon.png')
                    .paddingRight(7.px),
                Expanded(
                  child: CommonTextField(
                    inputCallBack: (value) {
                      viewModel.reqEntity.password = value;
                    },
                    focusNode: FocusNode(),
                    editingController: viewModel.pwdController,
                    obscureText: true,
                    contentPadding: EdgeInsets.only(bottom: 16.px, top: 16.px),
                    keyboardType: TextInputType.visiblePassword,
                    validation: (input) {},
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    showClearButton: true,
                    placeholder: '请输入密码',
                    placeholderStyle: TextStyle(
                        color: color_FF8F92A1, fontSize: 14.px, height: 1),
                    testStyle: TextStyle(fontSize: 14.px),
                  ),
                ),
              ],
            ),
          ),
          CommonCycleButton(
            onTap: () {
              viewModel.login();
            },
            height: 43.px,
            padding: EdgeInsets.all(0),
            bgColor: color_FF26DAFB,
            radius: 22.px,
            title: '登录',
          ),
        ],
      ),
    );
  }
}
