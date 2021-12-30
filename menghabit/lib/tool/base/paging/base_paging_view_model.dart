import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/list_notifier.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/utils/log_utils.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';
import 'package:menghabit/tool/widget/paging/paging_data_source.dart';
import 'package:menghabit/tool/widget/paging/paging_footer_status.dart';
import 'package:menghabit/tool/widget/paging/paging_refresh_status.dart';

/// 通用分页ViewModel
abstract class BasePagingViewModel<T extends BaseModel, ITEM>
    extends BaseViewModel<T> {
  /// 首次刷新
  bool _firstRefresh = true;

  /// 分页信息
  late PagingDataSource<ITEM> _dataSource;

  /// 加载更多状态
  ValueNotifier<FooterStatus> _footerStatus = ValueNotifier(FooterStatus.idle);

  /// 刷新状态
  ValueNotifier<RefreshStatus> _refreshStatus =
      ValueNotifier(RefreshStatus.idle);

  /// 列表数据
  late ListNotifier<ITEM> _items;

  BasePagingViewModel(T model) : super(model) {
    _dataSource = createDataSource();
    _items = _dataSource.getItems();
  }

  /// 刷新数据
  /// showDialog 是否显示弹窗，默认false，（当为false，且当前没有数据，则显示缺省进度）
  /// enableCancel 弹窗是否可返回键取消，取消后会退出页面
  void refresh({bool showDialog = false, bool enableCancel = false}) {
    if (_refreshStatus.value == RefreshStatus.refreshing) {
      return;
    }
    LogUtils.d("Paging ==> 刷新");
    _firstRefresh = false;
    _refreshStatus.value = RefreshStatus.refreshing;
    if (!showDialog && isEmptyData()) {
      mState = EmptyState.PROGRESS;
    }
    if (showDialog) {
      showLoadingDialog(enableCancel: enableCancel);
    }
    _dataSource.loadOnlineData(true);
  }

  @override
  void onReloadData() {
    refresh();
  }

  /// 加载更多
  void loadMore() {
    if (!enableLoadMore() ||
        _refreshStatus.value == RefreshStatus.refreshing ||
        _footerStatus.value == FooterStatus.loading ||
        _footerStatus.value == FooterStatus.noMore) {
      return;
    }
    LogUtils.d("Paging ==> 加载下一页");
    _footerStatus.value = FooterStatus.loading;
    _dataSource.loadOnlineData(isEmptyData());
  }

  /// 加载结束的状态处理
  void finishLoad(bool error) {
    dismissLoadingDialog();
    if (_dataSource.noMore() && !isEmptyData()) {
      LogUtils.d("Paging ==> 显示没有更多数据");
      _footerStatus.value = FooterStatus.noMore;
    } else {
      if (error &&
          (_footerStatus.value == FooterStatus.loading ||
              _footerStatus.value == FooterStatus.failed)) {
        LogUtils.d("Paging ==> 显示加载失败，点击重试");
        _footerStatus.value = FooterStatus.failed;
      } else {
        LogUtils.d("Paging ==> 加载成功，隐藏底部加载状态");
        _footerStatus.value = FooterStatus.idle;
      }
    }
    _refreshStatus.value = RefreshStatus.idle;
    if (isEmptyData()) {
      if (error) {
        LogUtils.d("Paging ==> 显示异常缺省");
        showNetError();
      } else {
        LogUtils.d("Paging ==> 显示无数据缺省");
        showEmpty();
      }
    } else {
      LogUtils.d("Paging ==> 加载成功，有数据");
      showNormal();
    }
  }

  /// 创建分页数据
  PagingDataSource<ITEM> createDataSource();

  /// 判断是否是空数据的条件，可重写
  bool isEmptyData() {
    return _items.isEmpty;
  }

  /// 是否支持下拉刷新
  bool enableRefresh() {
    return true;
  }

  /// 是否支持加载更多
  bool enableLoadMore() {
    return true;
  }

  /// 距离底部多少item时，预加载下一页
  int preloadOffset() {
    return 2;
  }

  ListNotifier<ITEM> get items => _items;

  ValueNotifier<FooterStatus> get footerStatus => _footerStatus;

  ValueNotifier<RefreshStatus> get refreshStatus => _refreshStatus;

  bool get firstRefresh => _firstRefresh;
}
