import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/icon_text.dart';
import 'package:meng_guo/function/discover/item/discover_hot_list_item.dart';
import 'package:meng_guo/function/discover/model/discover_model.dart';
import 'package:meng_guo/function/discover/viewmodel/discover_view_model.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:meng_guo/function/home/item/home_common_list_item.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_view_model.dart';
import 'package:meng_guo/function/message/viewmodel/message_view_model.dart';
import 'package:meng_guo/function/my/viewmodel/my_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';
import 'package:menghabit/tool/widget/base_model.dart';

class DiscoverPage extends StatelessWidget {
  static final String sName = "DiscoverPage";

  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('my page');
    return ViewModelProvider<DiscoverViewModel>(
      create: (context) => DiscoverViewModel(DiscoverModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<DiscoverViewModel>(
          viewModel: viewModel,
          body: _DiscoverView(viewModel: viewModel),
        );
      },
    );
  }
}

class _DiscoverView extends StatefulWidget {
  final DiscoverViewModel viewModel;
  const _DiscoverView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<_DiscoverView>
    with AutomaticKeepAliveClientMixin {
  DiscoverViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    print('build discover page');
    super.build(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          ValueListenableBuilder<List<String>>(
              valueListenable: viewModel.items,
              builder: (context, value, child) {
                return DiscoverHotListItem(items: value);
              }),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: color_FFF4F3F8,
                  width: 6.px,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHotTip(),
                ValueListenableBuilder<List<HomeListContentItemViewModel>?>(
                  valueListenable: viewModel.hotList,
                  builder: (context, value, child) {
                    if (value.orEmptyList().isEmpty) {
                      return _buildNoDataWidget();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return HomeCommonListItem(
                          index: index,
                          viewModel: value.orEmptyList()[index],
                        );
                      },
                      itemCount: value.orEmptyList().length,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/common/common_no_data.png',
          ),
          Text(
            '暂无内容',
            style: TextStyle(
              color: color_FFBDBDBD,
              fontSize: 16.px,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotTip() {
    return Container(
      padding: EdgeInsets.all(16.px),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color_FFF4F3F8,
            width: 1.px,
          ),
        ),
      ),
      child: IconText(
        '热门内容',
        padding: EdgeInsets.only(
          right: 5.px,
        ),
        iconSize: 15.px,
        icon: Image.asset('assets/images/discover/discover_hot_icon.png'),
        style: TextStyle(
          fontSize: 16.px,
          fontWeight: FontWeight.bold,
          color: color_FF000000,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
