import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class DetailCommentRespEntity with JsonConvert<DetailCommentRespEntity> {
  int? currentPage;

  int? perPage;

  String? firstPageUrl;

  String? nextPageUrl;

  String? prePageUrl;

  int? pageLength;

  int? totalCount;
  int? totalPage;

  List<DetailCommentEntity>? pageData;
}

class DetailCommentEntity with JsonConvert<DetailCommentEntity> {
  int? id;

  int? userId;

  int? threadId;

  int? replyCount;

  int? likeCount;

  String? createdAt;

  String? updatedAt;

  bool? isFirst;

  bool? isComment;

  int? isApproved;

  int? rewards;

  bool? canApprove;

  bool? canDelete;

  bool? canHide;

  bool? canLike;

  CommentUserEntity? user;

  List<String>? images;

  String? summaryText;

  String? content;

  bool? isDeleted;

  int? redPacketAmount;
  bool? isLiked;

  List<DetailCommentEntity>? lastThreeComments;
}

class CommentUserEntity with JsonConvert<CommentUserEntity> {
  int? id;

  String? nickname;

  String? avatar;

  String? realname;

  CommentGroupEntity? groups;

  bool? isReal;
}

class CommentGroupEntity with JsonConvert<CommentGroupEntity> {
  int? id;

  String? name;

  bool? isDisplay;

  int? level;
}

// class CommentLastThreeEntity with JsonConvert<CommentLastThreeEntity> {
//   int? id;
//
//   int? userId;
//
//   int? replyPostId;
//
//   int? threadId;int? replyUserId;
//
//   int? commentPostId;
//
//   int? commentUserId;
//
//   int? replyCount;int? likeCount;
//
//   String? createdAt;
//
//   String? updatedAt;
//
//   int? level;int? id;
//
//   String? name;
//
//   bool? isDisplay;
//
//   int? level;
// }
