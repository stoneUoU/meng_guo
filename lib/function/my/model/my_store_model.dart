import 'package:meng_guo/function/my/api/my_store_api.dart';
import 'package:meng_guo/function/my/entity/my_store_resp_entity.dart';
import 'package:meng_guo/net/net_extension.dart';
import 'package:menghabit/tool/base/extensions/string_extension.dart';
import 'package:menghabit/tool/widget/base_model.dart';

class MyStoreModel extends BaseModel {
  /// 发现顶部话题列表
  Future<MyStoreRespEntity> getMyHome(int userId) {
    return request<MyStoreRespEntity>(
      MyStoreApi.MY_Store_LIST.format([userId]),
      isPost: false,
    ).check();
  }
}
