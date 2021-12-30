import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/function/my/item/my_info_common_item.dart';
import 'package:meng_guo/function/my/item/my_info_item.dart';
import 'package:meng_guo/function/my/item/my_middle_action_item.dart';
import 'package:meng_guo/function/my/model/my_model.dart';
import 'package:meng_guo/function/my/viewmodel/my_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';
import 'package:menghabit/tool/widget/base_model.dart';

class MyPage extends StatelessWidget {
  static const String sName = "MyPage";

  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('my page');
    return ViewModelProvider<MyViewModel>(
      create: (context) => MyViewModel(MyModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<MyViewModel>(
          viewModel: viewModel,
          body: _MyView(
            viewModel: viewModel,
          ),
        );
      },
    );
  }
}

class _MyView extends StatefulWidget {
  final MyViewModel viewModel;
  const _MyView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _MyViewState createState() => _MyViewState();
}

class _MyViewState extends State<_MyView> with AutomaticKeepAliveClientMixin {
  MyViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    print('build Message page');
    super.build(context);

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyInfoItem(
              viewModel: viewModel,
            ),
            MyMiddleActionItem(),
            ValueListenableBuilder<int>(
                valueListenable: viewModel.listCount,
                builder: (context, value, child) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.px),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: color_FFF4F3F8, width: 1.px),
                      ),
                    ),
                    child: Text(
                      '我的主题 $value',
                      style: TextStyle(
                        color: color_FF000000,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.px,
                      ),
                    ),
                  );
                }),
            ValueListenableBuilder<bool>(
                valueListenable: viewModel.isLogin,
                builder: (context, value, child) {
                  return value
                      ? _buildMyWidget(viewModel)
                      : _buildNoDataWidget();
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildMyWidget(MyViewModel viewModel) {
    // List<HomeListContentItemViewModel>? list
    return ValueListenableBuilder<List<HomeListContentItemViewModel>?>(
        valueListenable: viewModel.myList,
        builder: (context, value, child) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MyInfoCommonItem(viewModel: value.orEmptyList()[index]);
            },
            itemCount: value.orEmptyList().length,
          );
        });
  }

  Widget _buildNoDataWidget() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 50.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/common/common_no_data.png',
            width: 81.px,
            height: 85.px,
          ),
          Text(
            '请先登录',
            style: TextStyle(
              color: color_FFBDBDBD,
              fontSize: 16.px,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
