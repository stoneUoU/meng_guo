import 'package:meng_guo/function/detail/entity/detail_comment_resp_entity.dart';

detailCommentRespEntityFromJson(
    DetailCommentRespEntity data, Map<String, dynamic> json) {
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
  if (json['firstPageUrl'] != null) {
    data.firstPageUrl = json['firstPageUrl'].toString();
  }
  if (json['nextPageUrl'] != null) {
    data.nextPageUrl = json['nextPageUrl'].toString();
  }
  if (json['prePageUrl'] != null) {
    data.prePageUrl = json['prePageUrl'].toString();
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
  if (json['pageData'] != null) {
    data.pageData = (json['pageData'] as List)
        .map((v) => DetailCommentEntity().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> detailCommentRespEntityToJson(
    DetailCommentRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['currentPage'] = entity.currentPage;
  data['perPage'] = entity.perPage;
  data['firstPageUrl'] = entity.firstPageUrl;
  data['nextPageUrl'] = entity.nextPageUrl;
  data['prePageUrl'] = entity.prePageUrl;
  data['pageLength'] = entity.pageLength;
  data['totalCount'] = entity.totalCount;
  data['totalPage'] = entity.totalPage;
  data['pageData'] = entity.pageData?.map((v) => v.toJson())?.toList();
  return data;
}

detailCommentEntityFromJson(
    DetailCommentEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['userId'] != null) {
    data.userId = json['userId'] is String
        ? int.tryParse(json['userId'])
        : json['userId'].toInt();
  }
  if (json['threadId'] != null) {
    data.threadId = json['threadId'] is String
        ? int.tryParse(json['threadId'])
        : json['threadId'].toInt();
  }
  if (json['replyCount'] != null) {
    data.replyCount = json['replyCount'] is String
        ? int.tryParse(json['replyCount'])
        : json['replyCount'].toInt();
  }
  if (json['likeCount'] != null) {
    data.likeCount = json['likeCount'] is String
        ? int.tryParse(json['likeCount'])
        : json['likeCount'].toInt();
  }
  if (json['createdAt'] != null) {
    data.createdAt = json['createdAt'].toString();
  }
  if (json['updatedAt'] != null) {
    data.updatedAt = json['updatedAt'].toString();
  }
  if (json['isFirst'] != null) {
    data.isFirst = json['isFirst'];
  }
  if (json['isComment'] != null) {
    data.isComment = json['isComment'];
  }
  if (json['isApproved'] != null) {
    data.isApproved = json['isApproved'] is String
        ? int.tryParse(json['isApproved'])
        : json['isApproved'].toInt();
  }
  if (json['rewards'] != null) {
    data.rewards = json['rewards'] is String
        ? int.tryParse(json['rewards'])
        : json['rewards'].toInt();
  }
  if (json['canApprove'] != null) {
    data.canApprove = json['canApprove'];
  }
  if (json['canDelete'] != null) {
    data.canDelete = json['canDelete'];
  }
  if (json['canHide'] != null) {
    data.canHide = json['canHide'];
  }
  if (json['canLike'] != null) {
    data.canLike = json['canLike'];
  }
  if (json['user'] != null) {
    data.user = CommentUserEntity().fromJson(json['user']);
  }
  if (json['images'] != null) {
    data.images = (json['images'] as List)
        .map((v) => v.toString())
        .toList()
        .cast<String>();
  }
  if (json['summaryText'] != null) {
    data.summaryText = json['summaryText'].toString();
  }
  if (json['content'] != null) {
    data.content = json['content'].toString();
  }
  if (json['isDeleted'] != null) {
    data.isDeleted = json['isDeleted'];
  }
  if (json['redPacketAmount'] != null) {
    data.redPacketAmount = json['redPacketAmount'] is String
        ? int.tryParse(json['redPacketAmount'])
        : json['redPacketAmount'].toInt();
  }
  if (json['isLiked'] != null) {
    data.isLiked = json['isLiked'];
  }
  if (json['lastThreeComments'] != null) {
    data.lastThreeComments = (json['lastThreeComments'] as List)
        .map((v) => DetailCommentEntity().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> detailCommentEntityToJson(DetailCommentEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['threadId'] = entity.threadId;
  data['replyCount'] = entity.replyCount;
  data['likeCount'] = entity.likeCount;
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  data['isFirst'] = entity.isFirst;
  data['isComment'] = entity.isComment;
  data['isApproved'] = entity.isApproved;
  data['rewards'] = entity.rewards;
  data['canApprove'] = entity.canApprove;
  data['canDelete'] = entity.canDelete;
  data['canHide'] = entity.canHide;
  data['canLike'] = entity.canLike;
  data['user'] = entity.user?.toJson();
  data['images'] = entity.images;
  data['summaryText'] = entity.summaryText;
  data['content'] = entity.content;
  data['isDeleted'] = entity.isDeleted;
  data['redPacketAmount'] = entity.redPacketAmount;
  data['isLiked'] = entity.isLiked;
  data['lastThreeComments'] =
      entity.lastThreeComments?.map((v) => v.toJson())?.toList();
  return data;
}

commentUserEntityFromJson(CommentUserEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['nickname'] != null) {
    data.nickname = json['nickname'].toString();
  }
  if (json['avatar'] != null) {
    data.avatar = json['avatar'].toString();
  }
  if (json['realname'] != null) {
    data.realname = json['realname'].toString();
  }
  if (json['groups'] != null) {
    data.groups = CommentGroupEntity().fromJson(json['groups']);
  }
  if (json['isReal'] != null) {
    data.isReal = json['isReal'];
  }
  return data;
}

Map<String, dynamic> commentUserEntityToJson(CommentUserEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['avatar'] = entity.avatar;
  data['realname'] = entity.realname;
  data['groups'] = entity.groups?.toJson();
  data['isReal'] = entity.isReal;
  return data;
}

commentGroupEntityFromJson(CommentGroupEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['isDisplay'] != null) {
    data.isDisplay = json['isDisplay'];
  }
  if (json['level'] != null) {
    data.level = json['level'] is String
        ? int.tryParse(json['level'])
        : json['level'].toInt();
  }
  return data;
}

Map<String, dynamic> commentGroupEntityToJson(CommentGroupEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['isDisplay'] = entity.isDisplay;
  data['level'] = entity.level;
  return data;
}
