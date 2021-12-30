import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/appbar/transparent_app_bar.dart';
import 'package:meng_guo/function/login/item/register_input_item.dart';
import 'package:meng_guo/function/login/model/login_model.dart';
import 'package:meng_guo/function/login/viewmodel/register_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';
import 'package:menghabit/tool/widget/base_model.dart';

class RegisterPage extends StatelessWidget {
  static const String sName = "RegisterPage";

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(LoginModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<RegisterViewModel>(
          resizeToAvoidBottomInset: true,
          viewModel: viewModel,
          body: _RegisterView(viewModel: viewModel),
        );
      },
    );
  }
}

class _RegisterView extends StatelessWidget {
  final RegisterViewModel viewModel;
  const _RegisterView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtils.screenH(),
      child: SingleChildScrollView(
        child: Column(
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
            RegisterInputItem()
          ],
        ),
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
