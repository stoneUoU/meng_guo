import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/appbar/transparent_app_bar.dart';
import 'package:meng_guo/function/login/item/login_input_item.dart';
import 'package:meng_guo/function/login/model/login_model.dart';
import 'package:meng_guo/function/login/pages/register_page.dart';
import 'package:meng_guo/function/login/viewmodel/login_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';
import 'package:menghabit/tool/widget/base_model.dart';

class LoginPage extends StatelessWidget {
  static const String sName = "LoginPage";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('home page');
    return ViewModelProvider<LoginViewModel>(
      create: (context) => LoginViewModel(LoginModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<LoginViewModel>(
          viewModel: viewModel,
          body: _LoginView(viewModel: viewModel),
        );
      },
    );
  }
}

class _LoginView extends StatelessWidget {
  final LoginViewModel viewModel;
  const _LoginView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtils.screenH(),
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset(
                    'assets/images/login/login_bg.png',
                    height: 180.px,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: TransparentAppBar(
                      title: '',
                      hasBack: true,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: _buildIconWidget(),
                  ),
                ],
              ),
              LoginInputItem(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterPage.sName);
              },
              child: Text(
                '注册账号',
                style: TextStyle(
                  color: color_FF05B7FF,
                  fontSize: 12.px,
                ),
              ),
            ),
          ).marginBottom(140.px),
        ],
      ),
    );
  }

  Widget _buildIconWidget() {
    return Row(
      children: [
        Image.asset(
          'assets/images/login/login_icon2.png',
          width: 48.px,
          height: 48.px,
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/login/login_icon.png',
              width: 75.px,
              height: 109.px,
            ),
            Image.asset(
              'assets/images/login/login_shape.png',
              width: 38.px,
              height: 9.px,
            ),
          ],
        ),
      ],
    ).paddingRight(25.px);
  }
}
