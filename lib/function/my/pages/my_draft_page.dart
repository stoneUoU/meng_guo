import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:meng_guo/function/my/model/my_draft_model.dart';
import 'package:meng_guo/function/my/viewmodel/my_draft_view_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/base/view_model_provider.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class MyDraftPage extends StatelessWidget {
  static const String sName = "MyDraftPage";

  const MyDraftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyDraftPage');
    return ViewModelProvider<MyDraftViewModel>(
      create: (context) => MyDraftViewModel(MyDraftModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<MyDraftViewModel>(
          viewModel: viewModel,
          body: _MyDraftView(
            viewModel: viewModel,
          ),
        );
      },
    );
  }
}

class _MyDraftView extends StatefulWidget {
  final MyDraftViewModel viewModel;
  const _MyDraftView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _MyDraftViewState createState() => _MyDraftViewState();
}

class _MyDraftViewState extends State<_MyDraftView> {
  MyDraftViewModel get viewModel => widget.viewModel;
  @override
  Widget build(BuildContext context) {
    print('build MyDraftPage');
    return Column(children: [
      MyDraftNavigationWidget(context: context),
      new Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/images/common/common_blank_data.png'),
        ),
      ),
      Container(height: ScreenUtils.padBotH(), width: ScreenUtils.screenW()),
    ]);
  }
}

class MyDraftNavigationWidget extends StatelessWidget {
  const MyDraftNavigationWidget({Key? key, required this.context})
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
                child: Text("我的草稿",
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
