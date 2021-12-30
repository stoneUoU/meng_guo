import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:meng_guo/function/my/model/my_store_model.dart';
import 'package:meng_guo/function/my/viewmodel/my_store_view_model.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/base/view_model_provider.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class MyStorePage extends StatelessWidget {
  static const String sName = "MyStorePage";

  const MyStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyStorePage');
    return ViewModelProvider<MyStoreViewModel>(
      create: (context) => MyStoreViewModel(MyStoreModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<MyStoreViewModel>(
          viewModel: viewModel,
          body: _MyStoreView(
            viewModel: viewModel,
          ),
        );
      },
    );
  }
}

class _MyStoreView extends StatefulWidget {
  final MyStoreViewModel viewModel;
  const _MyStoreView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _MyStoreViewState createState() => _MyStoreViewState();
}

class _MyStoreViewState extends State<_MyStoreView> {
  MyStoreViewModel get viewModel => widget.viewModel;
  @override
  Widget build(BuildContext context) {
    print('build MyStorePage');
    return Column(children: [
      MyStoreNavigationWidget(context: context),
      new Expanded(
        child: Container(
          child: Image.asset('assets/images/common/common_blank_data.png'),
        ),
      ),
      Container(height: ScreenUtils.padBotH(), width: ScreenUtils.screenW()),
    ]);
  }
}

class MyStoreNavigationWidget extends StatelessWidget {
  const MyStoreNavigationWidget({Key? key, required this.context})
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
                child: Text("我的收藏",
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
