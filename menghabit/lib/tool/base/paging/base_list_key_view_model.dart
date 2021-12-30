import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/paging/paging_data_source.dart';
import 'package:menghabit/tool/widget/paging/paging_key_data_source.dart';
import 'package:menghabit/tool/widget/paging/paging_loader.dart';

import 'base_paging_view_model.dart';

/// Desc:以key进行分页的ViewModel

abstract class BaseListKeyViewModel<T extends BaseModel, ITEM, KEY>
    extends BasePagingViewModel<T, ITEM> implements PagingKeyLoader<ITEM, KEY> {
  BaseListKeyViewModel(T model) : super(model);

  @override
  PagingDataSource<ITEM> createDataSource() {
    return PageKeyDataSource(getFirstKey(), this, (error) {
      finishLoad(error);
    });
  }

  /// 第一页的KEY
  KEY? getFirstKey();
}
