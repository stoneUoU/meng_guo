import 'package:flutter/services.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_cycle_button.dart';
import 'package:meng_guo/common/widget/common_text_field.dart';
import 'package:meng_guo/function/login/viewmodel/register_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';

class RegisterInputItem extends StatefulWidget {
  const RegisterInputItem({Key? key}) : super(key: key);

  @override
  _RegisterInputItemState createState() => _RegisterInputItemState();
}

class _RegisterInputItemState extends State<RegisterInputItem> {
  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = context.viewModel<RegisterViewModel>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.px),
      margin: EdgeInsets.only(top: 65.px),
      child: Form(
        key: viewModel.formKey,
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
                        viewModel.canRegister.value = value
                                .isNotNullOrEmpty() &&
                            viewModel.pwdController.text.isNotNullOrEmpty() &&
                            viewModel.confirmPwdController.text
                                .isNotNullOrEmpty() &&
                            viewModel.nickNameController.text
                                .isNotNullOrEmpty();
                        viewModel.reqEntity.username = value;
                      },
                      focusNode: FocusNode(),
                      editingController: viewModel.userController,
                      contentPadding:
                          EdgeInsets.only(bottom: 16.px, top: 16.px),
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
                        viewModel.canRegister.value = value
                                .isNotNullOrEmpty() &&
                            viewModel.userController.text.isNotNullOrEmpty() &&
                            viewModel.confirmPwdController.text
                                .isNotNullOrEmpty() &&
                            viewModel.nickNameController.text
                                .isNotNullOrEmpty();
                        viewModel.reqEntity.password = value;
                      },
                      focusNode: FocusNode(),
                      editingController: viewModel.pwdController,
                      obscureText: true,
                      contentPadding:
                          EdgeInsets.only(bottom: 16.px, top: 16.px),
                      keyboardType: TextInputType.visiblePassword,
                      validation: (input) {},
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      showClearButton: true,
                      placeholder: '请设置密码',
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
                        viewModel.canRegister.value = value
                                .isNotNullOrEmpty() &&
                            viewModel.pwdController.text.isNotNullOrEmpty() &&
                            viewModel.userController.text.isNotNullOrEmpty() &&
                            viewModel.nickNameController.text
                                .isNotNullOrEmpty();
                        viewModel.reqEntity.passwordConfirmation = value;
                      },
                      focusNode: FocusNode(),
                      editingController: viewModel.confirmPwdController,
                      obscureText: true,
                      contentPadding:
                          EdgeInsets.only(bottom: 16.px, top: 16.px),
                      keyboardType: TextInputType.visiblePassword,
                      validation: (input) {},
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      showClearButton: true,
                      placeholder: '请确认密码',
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
                        viewModel.canRegister.value = value
                                .isNotNullOrEmpty() &&
                            viewModel.pwdController.text.isNotNullOrEmpty() &&
                            viewModel.confirmPwdController.text
                                .isNotNullOrEmpty() &&
                            viewModel.userController.text.isNotNullOrEmpty();
                        viewModel.reqEntity.nickname = value;
                      },
                      focusNode: FocusNode(),
                      editingController: viewModel.nickNameController,
                      contentPadding:
                          EdgeInsets.only(bottom: 16.px, top: 16.px),
                      keyboardType: TextInputType.text,
                      validation: (input) {},
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      showClearButton: true,
                      placeholder: '请设置昵称',
                      placeholderStyle: TextStyle(
                          color: color_FF8F92A1, fontSize: 14.px, height: 1),
                      testStyle: TextStyle(fontSize: 14.px),
                    ),
                  ),
                ],
              ),
            ).marginBottom(45.px),
            ValueListenableBuilder<bool>(
                valueListenable: viewModel.canRegister,
                builder: (context, value, child) {
                  return CommonCycleButton(
                    onTap: value
                        ? () {
                            viewModel.register();
                          }
                        : null,
                    height: 43.px,
                    padding: const EdgeInsets.all(0),
                    bgColor: value ? color_FF26DAFB : color_FFF3F3F3,
                    radius: 21.5.px,
                    title: '立即注册',
                  );
                }),
          ],
        ),
      ),
    );
  }
}
