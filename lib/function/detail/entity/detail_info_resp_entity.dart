import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class DetailListDataEntity with JsonConvert<DetailListDataEntity> {
  int? threadId;

  int? postId;

  int? userId;

  int? parentCategoryId;

  int? topicId;

  ///分类名称
  String? categoryName;

  String? parentCategoryName;

  String? title;

  int? viewCount;

  int? isApproved;
  bool? isStick;
  bool? isDraft;

  bool? isSite;

  bool? isAnonymous;
  bool? isFavorite;
  double? price;

  double? payType;

  bool? paid;
  bool? isLike;
  bool? isReward;

  String? issueAt;

  String? createdAt;
  String? updatedAt;

  String? diffTime;
  double? freewords;

  bool? userStickStatus;

  ///用户信息
  HomeListDataUserEntity? user;
  //
  // ///用户组信息
  HomeListDataGroupEntity? group;
  DetailInfoRespEntity? content;

  HomeLikeEntity? likeReward;
}

class DetailInfoRespEntity with JsonConvert<DetailInfoRespEntity> {
  /// 帖子正文内容
  String? text;

  List<String>? tags;

  dynamic indexes;
// int? groupId;
//
// String? groupName;
// bool? isDisplay;
}

// class HomeContentImageEntity with JsonConvert<HomeContentImageEntity> {
// HomeContentImageRealEntity? 101.toString;
// }

class DetailContentImageRealEntity
    with JsonConvert<DetailContentImageRealEntity> {
  int? tomId;

  String? operation;

  List<DetailContentImageBodyEntity>? body;
}

class DetailContentImageBodyEntity
    with JsonConvert<DetailContentImageBodyEntity> {
  int? id;

  String? url;
}
