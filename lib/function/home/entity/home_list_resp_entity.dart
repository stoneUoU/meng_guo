import 'package:meng_guo/generated/json/base/json_convert_content.dart';

// class HomeEntityConstant {
//   /// 类型, 0-推荐，1-娱乐，2-科技，3-搞笑，4-体育，5-游戏
//   static const BILLS_RECOMMENDED = 0;
//   static const BILLS_ENTERTAINMENT = 1;
//   static const BILLS_TECHNOLOGY = 2;
//   static const BILLS_FUN = 3;
//   static const BILLS_SPORTS = 4;
//   static const BILLS_GAME = 5;
// }

class HomeListRespEntity with JsonConvert<HomeListRespEntity> {
  List<HomeListDataEntity>? pageData;

  int? currentPage;

  int? perPage;

  String? firstPageUrl;

  String? nextPageUrl;

  String? prePageUrl;

  int? pageLength;

  int? totalCount;

  int? totalPage;
}

class HomeListDataEntity with JsonConvert<HomeListDataEntity> {
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
  HomeListContentEntity? content;

  HomeLikeEntity? likeReward;
}

class HomeListDataUserEntity with JsonConvert<HomeListDataUserEntity> {
  int? userId;

  String? nickname;

  String? avatar;
  int? threadCount;

  int? followCount;
  int? fansCount;

  int? questionCount;

  bool? isRealName;

  String? joinedAt;
}

class HomeListDataGroupEntity with JsonConvert<HomeListDataGroupEntity> {
  String? groupIcon;

  int? groupId;

  String? groupName;
  bool? isDisplay;
}

class HomeListContentEntity with JsonConvert<HomeListContentEntity> {
  /// 帖子正文内容
  String? text;

  List<String>? tags;

  dynamic indexes;

  // HomeContentImageRealEntity? indexes;
  // int? groupId;
  //
  // String? groupName;
  // bool? isDisplay;
}

// class HomeContentImageEntity with JsonConvert<HomeContentImageEntity> {
// HomeContentImageRealEntity? 101.toString;
// }

class HomeContentImageRealEntity with JsonConvert<HomeContentImageRealEntity> {
  int? tomId;

  String? operation;

  List<HomeContentImageBodyEntity>? body;
}

class HomeContentImageBodyEntity with JsonConvert<HomeContentImageBodyEntity> {
  int? id;

  String? url;
}

class HomeLikeEntity with JsonConvert<HomeLikeEntity> {
  int? likePayCount;

  int? postCount;

  int? shareCount;
}
