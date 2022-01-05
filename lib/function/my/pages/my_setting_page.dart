import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:meng_guo/function/my/model/my_model.dart';
import 'package:meng_guo/function/my/pages/my_about_page.dart';
import 'package:meng_guo/function/my/viewmodel/my_view_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/base/view_model_provider.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/utils/toast_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

typedef void MySettingPageExitListener();

class MySettingPage extends StatelessWidget {
  static const String sName = "MySettingPage";
  final MyViewModel myViewModel;
  const MySettingPage({Key? key, required this.myViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MySettingView(myViewModel: myViewModel);
  }
}

class _MySettingView extends StatefulWidget {
  final MyViewModel myViewModel;
  const _MySettingView({Key? key, required this.myViewModel}) : super(key: key);

  @override
  _MySettingViewState createState() => _MySettingViewState();
}

class _MySettingViewState extends State<_MySettingView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MyViewModel>(
      create: (context) => MyViewModel(MyModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<MyViewModel>(
          viewModel: widget.myViewModel,
          body: Container(
            child: Column(children: [
              MyMessageNavigationWidget(context: context),
              AboutUsWidget(context: context),
              ValueListenableBuilder<bool>(
                  valueListenable: widget.myViewModel.isLogin,
                  builder: (context, value, child) {
                    if (value) {
                      return ExitLoginWidget(
                        context: context,
                        myViewModel: widget.myViewModel,
                      );
                    } else {
                      return Container();
                    }
                  })
            ]),
            color: Colors.white,
          ),
        );
      },
    );
  }
}

class MyMessageNavigationWidget extends StatelessWidget {
  const MyMessageNavigationWidget({Key? key, required this.context})
      : super(key: key);
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.screenW(),
      height: ScreenUtils.navigationBarHeight(),
      color: Colors.white,
      child: Column(
        children: [
          Container(
              width: ScreenUtils.screenW(), height: ScreenUtils.padTopH()),
          Stack(children: [
            Container(
                width: ScreenUtils.screenW(),
                height: kToolbarHeight,
                alignment: Alignment.center,
                child: Text("设置",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            Positioned(
                child: CommonHighLightIconButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  iconSize: Size(28.px, 28.px),
                  imageName: 'assets/images/common/common_icon_back_dark.png',
                  iconColor: Colors.black,
                ),
                left: 16,
                top: 12)
          ])
        ],
      ),
    );
  }
}

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            margin: EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Image.asset("assets/images/my/my_about.png",
                          fit: BoxFit.fill),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "关于我们",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: color_FF303133,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                Image.asset('assets/images/common/arrow_right.png',
                    fit: BoxFit.fill),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, MyAboutPage.sName);
          },
        ),
        Container(
          height: 8.px,
          width: ScreenUtils.screenW(),
          color: color_FFF4F3F8,
        )
      ],
    );
  }
}

class ExitLoginWidget extends StatelessWidget {
  const ExitLoginWidget(
      {Key? key, required this.context, required this.myViewModel})
      : super(key: key);
  final BuildContext context;
  final MyViewModel myViewModel;
  @override
  Widget build(BuildContext context) {
    MyViewModel viewModel = context.viewModel<MyViewModel>();
    return Container(
      child: Column(
        children: [
          InkWell(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  "退出登录",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color_FF303133,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            onTap: () {
              this.func(() {
                this.myViewModel.logout();
                Navigator.pop(context);
                ToastUtils.showShort('退出成功！');
              });
            },
          ),
          Container(
            height: 8.px,
            width: ScreenUtils.screenW(),
            color: color_FFF4F3F8,
          ),
        ],
      ),
    );
  }

  void func(MySettingPageExitListener listener) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('是否退出登录?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('取消'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (listener != null) {
                    listener();
                  }
                },
                textColor: color_FF4272e0,
                child: Text('退出登录'),
              ),
            ],
          );
        });
  }
}
