import 'package:meng_guo/function/message/api/message_api.dart';
import 'package:meng_guo/function/message/entity/message_replied_resp_entity.dart';
import 'package:meng_guo/function/message/entity/message_system_resp_entity.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:meng_guo/net/net_extension.dart';
import 'package:menghabit/menghabit.dart';

class MessageModel extends BaseModel {
  /// 系统消息
  Future<MessageSystemRespEntity> getSystemMessage(int page) {
    return request<MessageSystemRespEntity>(
      MessageApi.MESSAGE_SYSTEM.format([page]),
      isPost: false,
    ).check();
  }

  /// 我的消息
  Future<MessageSystemRespEntity> getMyMessage(int page) {
    return request<MessageSystemRespEntity>(
      MessageApi.MESSAGE_MY.format([page]),
      isPost: false,
    ).check();
  }

  /// 帖子消息
  Future<MessageRepliedRespEntity> getTipMessage(int page) {
    return request<MessageRepliedRespEntity>(
      MessageApi.MESSAGE_TIP.format([page]),
      isPost: false,
    ).check();
  }
}
