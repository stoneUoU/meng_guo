import 'package:meng_guo/function/message/entity/message_replied_resp_entity.dart';
import 'package:meng_guo/function/message/entity/message_system_resp_entity.dart';

class MessageContentItemViewModel {
  /// icon
  String userIcon = '';

  /// 标题
  String title = '';

  /// 时间
  String time = '';

  /// 内容
  String content = '';

  MessageContentItemViewModel(
    MessageSystemPageDataEntity? entity1,
    MessageRepliedPageDataEntity? entity2,
  ) {
    if (entity1 != null) {
      userIcon = entity1.userAvatar ?? '';
      title = entity1.title ?? '';
      time = entity1.createdAt ?? '';
      content = entity1.content ?? '';
    } else {
      userIcon = entity2?.userAvatar ?? '';
      title = entity2?.nickname ?? '';
      time = entity2?.postCreatedAt ?? '';
      content = entity2?.postContent ?? '';
    }
  }
}
