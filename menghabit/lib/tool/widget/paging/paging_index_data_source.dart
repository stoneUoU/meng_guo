import 'dart:math';

import 'package:menghabit/tool/base/list_notifier.dart';
import 'package:menghabit/tool/widget/paging/paging_data_source.dart';
import 'package:menghabit/tool/widget/paging/paging_loader.dart';

import 'paging_load_callback.dart';

/// 初始页面
const int PAGE_NUM_INIT = 1;

/// 保存页码分页信息
class PageIndexDataSource<ITEM> extends PagingDataSource<ITEM>
    implements LoadCallback<ITEM> {
  /// 可观测的数据源
  final ListNotifier<ITEM> _source = ListNotifier();

  /// 加载器
  final PagingIndexLoader<ITEM> _dataLoader;

  /// 加载回调
  final Function(bool error) _loadResult;

  /// 下一页页码
  int _nextPageIndex = PAGE_NUM_INIT;

  /// 总页数
  int _totalPages = PAGE_NUM_INIT;

  PageIndexDataSource(this._dataLoader, this._loadResult);

  @override
  ListNotifier<ITEM> getItems() {
    return _source;
  }

  @override
  void loadOnlineData(bool refresh) {
    if (refresh) {
      _dataLoader.loadData(PAGE_NUM_INIT, this);
    } else {
      _dataLoader.loadData(max(_nextPageIndex, PAGE_NUM_INIT + 1), this);
    }
  }

  @override
  bool noMore() {
    return _nextPageIndex > _totalPages;
  }

  @override
  void onFailure() {
    _loadResult(true);
  }

  @override
  void onSuccess(List<ITEM> items, int? pageIndex, int? totalPages) {
    _nextPageIndex = pageIndex == null ? PAGE_NUM_INIT : (pageIndex + 1);
    _totalPages = totalPages ?? PAGE_NUM_INIT;
    if (pageIndex != null && pageIndex > PAGE_NUM_INIT) {
      _source.addAll(items);
    } else {
      _source.clear();
      _source.addAll(items);
    }
    _loadResult(false);
  }
}
