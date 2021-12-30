import 'package:menghabit/tool/base/request/base_request_option.dart';
import 'package:menghabit/tool/network/vv_net_work.dart';
import 'package:menghabit/tool/widget/IModel.dart';

///基础数据仓库层
class BaseModel with BaseRequestOptionsMixin implements IModel {
  late VvRequestClient _apiService;

  BaseModel() {
    this._apiService = VvRequestClient();
  }

  @override
  void onClear() {
    cancelRequest();
  }

  VvRequestClient get apiService => _apiService;
}
