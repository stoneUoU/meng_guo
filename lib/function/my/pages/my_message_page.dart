import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:meng_guo/function/my/model/my_message_model.dart';
import 'package:meng_guo/function/my/viewmodel/my_message_view_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/base/view_model_provider.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class MyMessagePage extends StatelessWidget {
  static const String sName = "MyMessagePage";

  const MyMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyMessagePage');
    return ViewModelProvider<MyMessageViewModel>(
      create: (context) => MyMessageViewModel(MyMessageModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<MyMessageViewModel>(
          viewModel: viewModel,
          body: _MyMessageView(
            viewModel: viewModel,
          ),
        );
      },
    );
  }
}

class _MyMessageView extends StatefulWidget {
  final MyMessageViewModel viewModel;
  const _MyMessageView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _MyMessageViewState createState() => _MyMessageViewState();
}

class _MyMessageViewState extends State<_MyMessageView> {
  MyMessageViewModel get viewModel => widget.viewModel;
  @override
  Widget build(BuildContext context) {
    print('build MyMessagePage');
    return Column(children: [
      MyMessageNavigationWidget(context: context),
      new Expanded(
        child: Container(
          child: Image.asset('assets/images/common/common_blank_data.png'),
        ),
      ),
      Container(height: ScreenUtils.padBotH(), width: ScreenUtils.screenW()),
    ]);
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
                child: Text("我的消息",
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
