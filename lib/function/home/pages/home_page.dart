import 'package:flutter/material.dart';
import 'package:meng_guo/function/home/model/home_model.dart';
import 'package:meng_guo/function/home/pages/home_list_tab_page.dart';
import 'package:meng_guo/function/home/viewmodel/home_list_tab_view_model.dart';
import 'package:meng_guo/function/home/viewmodel/home_view_model.dart';
import 'package:meng_guo/router/router_lifecycle_widget.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/widget/base/base_scaffold.dart';

class HomePage extends StatelessWidget {
  static const String sName = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('home page');

    return ViewModelProvider<HomeViewModel>(
      create: (context) => HomeViewModel(HomeModel()),
      initViewModel: (context, viewModel) => viewModel.initialise(context),
      builder: (context, viewModel, child) {
        return BaseScaffold<HomeViewModel>(
          viewModel: viewModel,
          body: _HomeListView(viewModel: viewModel),
        );
      },
    );
  }
}

class _HomeListView extends StatefulWidget {
  final HomeViewModel viewModel;
  const _HomeListView({Key? key, required this.viewModel}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<_HomeListView>
    with AutomaticKeepAliveClientMixin {
  HomeViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return RouterLifeCycleWidget(onResume: () {
      Future.delayed(Duration(milliseconds: 500), () {
        viewModel.getData();
      });
    }, builder: (context, child) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: ListListenableBuilder<HomeListTabViewModel>(
          listListenable: viewModel.pageTabViewModelList,
          builder: (context, value, child) {
            return HomeListTab(viewModel: viewModel);
          },
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
