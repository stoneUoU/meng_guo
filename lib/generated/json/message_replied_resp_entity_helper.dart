import 'package:meng_guo/function/message/entity/message_replied_resp_entity.dart';

messageRepliedRespEntityFromJson(
    MessageRepliedRespEntity data, Map<String, dynamic> json) {
  if (json['pageData'] != null) {
    data.pageData = (json['pageData'] as List)
        .map((v) => MessageRepliedPageDataEntity().fromJson(v))
        .toList();
  }
  if (json['currentPage'] != null) {
    data.currentPage = json['currentPage'] is String
        ? int.tryParse(json['currentPage'])
        : json['currentPage'].toInt();
  }
  if (json['perPage'] != null) {
    data.perPage = json['perPage'] is String
        ? int.tryParse(json['perPage'])
        : json['perPage'].toInt();
  }
  if (json['pageLength'] != null) {
    data.pageLength = json['pageLength'] is String
        ? int.tryParse(json['pageLength'])
        : json['pageLength'].toInt();
  }
  if (json['totalCount'] != null) {
    data.totalCount = json['totalCount'] is String
        ? int.tryParse(json['totalCount'])
        : json['totalCount'].toInt();
  }
  if (json['totalPage'] != null) {
    data.totalPage = json['totalPage'] is String
        ? int.tryParse(json['totalPage'])
        : json['totalPage'].toInt();
  }
  return data;
}

Map<String, dynamic> messageRepliedRespEntityToJson(
    MessageRepliedRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['pageData'] = entity.pageData?.map((v) => v.toJson())?.toList();
  data['currentPage'] = entity.currentPage;
  data['perPage'] = entity.perPage;
  data['pageLength'] = entity.pageLength;
  data['totalCount'] = entity.totalCount;
  data['totalPage'] = entity.totalPage;
  return data;
}

messageRepliedPageDataEntityFromJson(
    MessageRepliedPageDataEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['type'] != null) {
    data.type = json['type'].toString();
  }
  if (json['userId'] != null) {
    data.userId = json['userId'] is String
        ? int.tryParse(json['userId'])
        : json['userId'].toInt();
  }
  if (json['readAt'] != null) {
    data.readAt = json['readAt'].toString();
  }
  if (json['createdAt'] != null) {
    data.createdAt = json['createdAt'].toString();
  }
  if (json['threadId'] != null) {
    data.threadId = json['threadId'] is String
        ? int.tryParse(json['threadId'])
        : json['threadId'].toInt();
  }
  if (json['threadUsername'] != null) {
    data.threadUsername = json['threadUsername'].toString();
  }
  if (json['threadNickname'] != null) {
    data.threadNickname = json['threadNickname'].toString();
  }
  if (json['threadTitle'] != null) {
    data.threadTitle = json['threadTitle'].toString();
  }
  if (json['threadCreatedAt'] != null) {
    data.threadCreatedAt = json['threadCreatedAt'].toString();
  }
  if (json['postId'] != null) {
    data.postId = json['postId'] is String
        ? int.tryParse(json['postId'])
        : json['postId'].toInt();
  }
  if (json['postContent'] != null) {
    data.postContent = json['postContent'].toString();
  }
  if (json['replyPostId'] != null) {
    data.replyPostId = json['replyPostId'] is String
        ? int.tryParse(json['replyPostId'])
        : json['replyPostId'].toInt();
  }
  if (json['postCreatedAt'] != null) {
    data.postCreatedAt = json['postCreatedAt'].toString();
  }
  if (json['isFirst'] != null) {
    data.isFirst = json['isFirst'];
  }
  if (json['userAvatar'] != null) {
    data.userAvatar = json['userAvatar'].toString();
  }
  if (json['nickname'] != null) {
    data.nickname = json['nickname'].toString();
  }
  if (json['isReal'] != null) {
    data.isReal = json['isReal'];
  }
  if (json['threadUserGroups'] != null) {
    data.threadUserGroups = json['threadUserGroups'].toString();
  }
  if (json['threadIsApproved'] != null) {
    data.threadIsApproved = json['threadIsApproved'] is String
        ? int.tryParse(json['threadIsApproved'])
        : json['threadIsApproved'].toInt();
  }
  if (json['threadUserNickname'] != null) {
    data.threadUserNickname = json['threadUserNickname'].toString();
  }
  if (json['threadUserAvatar'] != null) {
    data.threadUserAvatar = json['threadUserAvatar'].toString();
  }
  if (json['isReply'] != null) {
    data.isReply = json['isReply'] is String
        ? int.tryParse(json['isReply'])
        : json['isReply'].toInt();
  }
  return data;
}

Map<String, dynamic> messageRepliedPageDataEntityToJson(
    MessageRepliedPageDataEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['readAt'] = entity.readAt;
  data['createdAt'] = entity.createdAt;
  data['threadId'] = entity.threadId;
  data['threadUsername'] = entity.threadUsername;
  data['threadNickname'] = entity.threadNickname;
  data['threadTitle'] = entity.threadTitle;
  data['threadCreatedAt'] = entity.threadCreatedAt;
  data['postId'] = entity.postId;
  data['postContent'] = entity.postContent;
  data['replyPostId'] = entity.replyPostId;
  data['postCreatedAt'] = entity.postCreatedAt;
  data['isFirst'] = entity.isFirst;
  data['userAvatar'] = entity.userAvatar;
  data['nickname'] = entity.nickname;
  data['isReal'] = entity.isReal;
  data['threadUserGroups'] = entity.threadUserGroups;
  data['threadIsApproved'] = entity.threadIsApproved;
  data['threadUserNickname'] = entity.threadUserNickname;
  data['threadUserAvatar'] = entity.threadUserAvatar;
  data['isReply'] = entity.isReply;
  return data;
}
