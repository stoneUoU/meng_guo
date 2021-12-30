import 'package:menghabit/tool/widget/base_model.dart';
import 'package:menghabit/tool/widget/paging/paging_data_source.dart';
import 'package:menghabit/tool/widget/paging/paging_index_data_source.dart';
import 'package:menghabit/tool/widget/paging/paging_loader.dart';

import 'base_paging_view_model.dart';

/// 以页码进行分页的ViewModel
///
abstract class BaseListViewModel<T extends BaseModel, ITEM>
    extends BasePagingViewModel<T, ITEM> implements PagingIndexLoader<ITEM> {
  BaseListViewModel(T model) : super(model);

  PagingDataSource<ITEM> createDataSource() {
    return PageIndexDataSource(this, (error) {
      finishLoad(error);
    });
  }
}
