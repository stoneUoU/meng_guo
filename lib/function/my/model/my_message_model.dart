import 'package:meng_guo/function/my/api/my_message_api.dart';
import 'package:meng_guo/function/my/entity/my_message_resp_entity.dart';
import 'package:meng_guo/net/net_extension.dart';
import 'package:menghabit/tool/base/extensions/string_extension.dart';
import 'package:menghabit/tool/widget/base_model.dart';

class MyMessageModel extends BaseModel {
  /// 发现顶部话题列表
  Future<MyMessageRespEntity> getMyHome(int userId) {
    return request<MyMessageRespEntity>(
      MyMessageApi.MY_Message_LIST.format([userId]),
      isPost: false,
    ).check();
  }
}
