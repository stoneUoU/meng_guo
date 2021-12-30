import 'package:meng_guo/function/message/entity/message_system_resp_entity.dart';

messageSystemRespEntityFromJson(
    MessageSystemRespEntity data, Map<String, dynamic> json) {
  if (json['pageData'] != null) {
    data.pageData = (json['pageData'] as List)
        .map((v) => MessageSystemPageDataEntity().fromJson(v))
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

Map<String, dynamic> messageSystemRespEntityToJson(
    MessageSystemRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['pageData'] = entity.pageData?.map((v) => v.toJson())?.toList();
  data['currentPage'] = entity.currentPage;
  data['perPage'] = entity.perPage;
  data['pageLength'] = entity.pageLength;
  data['totalCount'] = entity.totalCount;
  data['totalPage'] = entity.totalPage;
  return data;
}

messageSystemPageDataEntityFromJson(
    MessageSystemPageDataEntity data, Map<String, dynamic> json) {
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
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['content'] != null) {
    data.content = json['content'].toString();
  }
  if (json['replyPostId'] != null) {
    data.replyPostId = json['replyPostId'] is String
        ? int.tryParse(json['replyPostId'])
        : json['replyPostId'].toInt();
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

Map<String, dynamic> messageSystemPageDataEntityToJson(
    MessageSystemPageDataEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['readAt'] = entity.readAt;
  data['createdAt'] = entity.createdAt;
  data['title'] = entity.title;
  data['content'] = entity.content;
  data['replyPostId'] = entity.replyPostId;
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
