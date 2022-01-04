import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/appbar/transparent_app_bar.dart';
import 'package:meng_guo/function/login/item/register_input_item.dart';
import 'package:meng_guo/function/login/model/login_model.dart';
import 'package:meng_guo/function/login/viewmodel/register_view_model.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_detail_page.dart';
import 'package:meng_guo/function/luanch/pages/user_agreement_page.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

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
          body: RegisterView(viewModel: viewModel),
        );
      },
    );
  }
}

class RegisterView extends StatefulWidget {
  final RegisterViewModel viewModel;
  const RegisterView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _checkboxSelected = false; //维护复选框状态

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
            RegisterInputItem(),
            _buildAgreementContainer(context)
          ],
        ),
      ),
    );
  }

  Container _buildAgreementContainer(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 32.px),
        height: 72.px,
        width: ScreenUtils.screenW(),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: _checkboxSelected,
              activeColor: color_FF4272e0, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value ?? false;
                  widget.viewModel.reqEntity.isCheckAgreement =
                      _checkboxSelected;
                });
              },
            ),
            RichText(
              text: TextSpan(
                  text: "我已阅读并同意",
                  style: TextStyle(
                    height: 1.5,
                    color: color_FF909399,
                    fontSize: 12.px,
                  ),
                  children: [
                    TextSpan(
                        text: "《用户注册协议》",
                        style: TextStyle(
                          height: 1.5,
                          color: color_FF1B65B9,
                          fontSize: 12.px,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, UserAgreementPage.sName);
                          }),
                    TextSpan(
                      text: "和",
                      style: TextStyle(
                        height: 1.5,
                        color: color_FF909399,
                        fontSize: 12.px,
                      ),
                    ),
                    TextSpan(
                        text: "《隐私政策》",
                        style: TextStyle(
                          height: 1.5,
                          color: color_FF1B65B9,
                          fontSize: 12.px,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, PrivacyPolicyDetailPage.sName);
                          }),
                  ]),
            )
          ],
        ));
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
