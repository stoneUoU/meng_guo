import 'package:meng_guo/function/my/api/my_draft_api.dart';
import 'package:meng_guo/function/my/entity/my_draft_resp_entity.dart';
import 'package:meng_guo/net/net_extension.dart';
import 'package:menghabit/tool/base/extensions/string_extension.dart';
import 'package:menghabit/tool/widget/base_model.dart';

class MyDraftModel extends BaseModel {
  /// 发现顶部话题列表
  Future<MyDraftRespEntity> getMyHome(int userId) {
    return request<MyDraftRespEntity>(
      MyDraftApi.MY_Draft_LIST.format([userId]),
      isPost: false,
    ).check();
  }
}
