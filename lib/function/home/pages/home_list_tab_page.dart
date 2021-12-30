import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/tabbar/common_tabbar_indicator.dart';
import 'package:meng_guo/common/widget/tabbar/scale_tabbar.dart';
import 'package:meng_guo/function/home/item/home_common_list_item.dart';
import 'package:meng_guo/function/home/item/home_movie_list_item.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_item_view_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_tab_view_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_view_model.dart';
import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/paging/base_list_widget.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

/// 列表 分页指示器
class HomeListTab extends StatefulWidget {
  final HomeViewModel viewModel;

  HomeListTab({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  _HomeListTabState createState() => _HomeListTabState();
}

class _HomeListTabState extends State<HomeListTab>
    with SingleTickerProviderStateMixin {
  HomeViewModel get viewModel => widget.viewModel;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: viewModel.pageTabIndex.value,
      length: viewModel.pageTabViewModelList.length,
      vsync: this,
    );
    viewModel.pageTabIndex.addListener(_changeIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    viewModel.pageTabIndex.removeListener(_changeIndex);
    super.dispose();
  }

  void _changeIndex() {
    _tabController.index = viewModel.pageTabIndex.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 47.px,
          padding: EdgeInsets.symmetric(horizontal: 4.px),
          child: Row(
            children: [
              Expanded(
                child: ScaleTabBar(
                  controller: _tabController,
                  unselectedLabelColor: color_FF999999,
                  unselectedLabelStyle: TextStyle(
                      fontSize: 16.px,
                      color: color_FF8F92A1,
                      fontWeight: FontWeight.w400),
                  labelColor: color_FF4A9BF7,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 12.px),
                  labelStyle: TextStyle(
                      fontSize: 16.px,
                      color: color_FF333333,
                      fontWeight: FontWeight.w500),
                  indicator: CommonUnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0, color: color_FF4A9BF7),
                      indicatorWidth: 24.px),
                  onTap: (index) {
                    viewModel.pageTabIndex.value = index;
                  },
                  tabs: List.generate(
                    viewModel.pageTabViewModelList.length,
                    (index) {
                      return Text(viewModel.pageTabViewModelList[index].title);
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/home/home_search.png',
                  width: 15.px,
                  height: 15.px,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: viewModel.pageTabViewModelList
                .map(
                  (e) => HomeListTabPage(
                    viewModel: e,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

/// 列表 分页
class HomeListTabPage extends StatelessWidget {
  final HomeListTabViewModel viewModel;

  const HomeListTabPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChildViewModelProvider<HomeViewModel, HomeListTabViewModel>(
      changeViewModel: (context, parent, viewModel, oldViewModel) {
        viewModel.setAppBarShow(false);
      },
      create: (context, parent) => viewModel,
      builder: (context, parent, viewModel, child) => BaseScaffold(
        viewModel: viewModel,
        body: Container(
          color: color_FFF5F5F5,
          child: VvListView<HomeListTabViewModel>(
            key: viewModel.pageListKey,
            footerBottom: 88.px,
            builder: (context, index) {
              final item = viewModel.items[index];
              Widget widget;
              if (item is HomeListContentItemViewModel) {
                widget = HomeCommonListItem(
                  index: index,
                  viewModel: item,
                );
              } else {
                widget = SizedBox();
              }
              return widget;
            },
          ),
        ),
      ),
    );
  }
}
