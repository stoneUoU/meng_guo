import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/widget/paging/paging_footer.dart';
import 'package:menghabit/tool/widget/paging/paging_refresh_status.dart';

import 'base_paging_view_model.dart';

/// 带有下拉刷新及上拉加载功能的ListView
/// 目前实现方式是禁用EasyRefresh的上拉加载功能，以插入item的形式实现上拉加载
///
class VvListView<VM extends BasePagingViewModel> extends StatefulWidget {
  /// 创建item
  final IndexWidgetBuilder builder;

  /// 进入自动刷新
  final bool firstRefresh;

  /// 下拉刷新样式
  final Header? refreshHeader;

  /// 给底部加载的footer添加一个底部间距，只针对默认的footer有效(不包含footer本身高度64px)
  final double footerBottom;

  /// 自定义底部加载的footer
  final Widget? footer;

  @override
  _VvListState createState() {
    return _VvListState<VM>();
  }

  const VvListView({
    Key? key,
    required this.builder,
    this.firstRefresh = true,
    this.refreshHeader,
    this.footer,
    this.footerBottom = 0,
  }) : super(key: key);
}

class _VvListState<VM extends BasePagingViewModel> extends State<VvListView> {
  EasyRefreshController _easyRefreshController = EasyRefreshController();
  late BasePagingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<VM>();
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      if (widget.firstRefresh && _viewModel.firstRefresh) {
        _viewModel.refresh();
      }
    });
    _viewModel.refreshStatus.addListener(_refreshStatusListener);
  }

  /// 下拉刷新
  void _refreshStatusListener() {
    RefreshStatus status = _viewModel.refreshStatus.value;
    if (status == RefreshStatus.idle && _viewModel.enableRefresh()) {
      _easyRefreshController.finishRefresh(success: true, noMore: false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.refreshStatus.removeListener(_refreshStatusListener);
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      controller: _easyRefreshController,
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      firstRefresh: false,
      // header: widget.refreshHeader ?? refreshHeaderBuilder.call(),
      slivers: <Widget>[
        ListListenableBuilder<dynamic>(
          listListenable: _viewModel.items,
          builder: (context, value, child) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  /// 最后一个为footer
                  if (index == _viewModel.items.length) {
                    return widget.footer ??
                        PagingFooter<VM>(footerBottom: widget.footerBottom);
                  }

                  /// 预加载下一页
                  if (index ==
                      _viewModel.items.length - _viewModel.preloadOffset()) {
                    _viewModel.loadMore();
                  }
                  return widget.builder(context, index);
                },
                childCount:
                    _viewModel.items.length > 0 && _viewModel.enableLoadMore()
                        ? _viewModel.items.length + 1
                        : _viewModel.items.length,
              ),
            );
          },
        ),
      ],
      onRefresh: _viewModel.enableRefresh()
          ? () async {
              _viewModel.refresh();
            }
          : null,
      onLoad: null,
    );
  }
}

typedef IndexWidgetBuilder = Widget Function(BuildContext context, int index);
