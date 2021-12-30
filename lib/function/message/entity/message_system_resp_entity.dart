import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class MessageSystemRespEntity with JsonConvert<MessageSystemRespEntity> {
  List<MessageSystemPageDataEntity>? pageData;

  int? currentPage;

  int? perPage;

  int? pageLength;

  int? totalCount;

  int? totalPage;
}

class MessageSystemPageDataEntity
    with JsonConvert<MessageSystemPageDataEntity> {
  int? id;

  String? type;

  int? userId;

  String? readAt;

  String? createdAt;

  String? title;

  String? content;

  int? replyPostId;

  String? userAvatar;

  String? nickname;

  bool? isReal;

  String? threadUserGroups;

  int? threadIsApproved;

  String? threadUserNickname;

  String? threadUserAvatar;

  int? isReply;
}
