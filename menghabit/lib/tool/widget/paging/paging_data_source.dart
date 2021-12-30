import 'package:menghabit/tool/base/list_notifier.dart';

/// 数据源
abstract class PagingDataSource<ITEM> {
  /// 获取可观测数据集合
  ListNotifier<ITEM> getItems();

  /// 加载数据
  /// refresh 是否是刷新
  void loadOnlineData(bool refresh);

  /// 是否无更多数据
  bool noMore();
}
