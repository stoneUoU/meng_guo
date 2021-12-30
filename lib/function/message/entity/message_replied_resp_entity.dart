import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class MessageRepliedRespEntity with JsonConvert<MessageRepliedRespEntity> {
  List<MessageRepliedPageDataEntity>? pageData;

  int? currentPage;

  int? perPage;

  int? pageLength;

  int? totalCount;

  int? totalPage;
}

class MessageRepliedPageDataEntity
    with JsonConvert<MessageRepliedPageDataEntity> {
  int? id;

  String? type;

  int? userId;

  String? readAt;

  String? createdAt;

  int? threadId;

  String? threadUsername;

  String? threadNickname;

  String? threadTitle;

  String? threadCreatedAt;

  int? postId;

  String? postContent;

  int? replyPostId;

  String? postCreatedAt;

  bool? isFirst;

  String? userAvatar;

  String? nickname;

  bool? isReal;

  String? threadUserGroups;

  int? threadIsApproved;

  String? threadUserNickname;

  String? threadUserAvatar;

  int? isReply;
}
