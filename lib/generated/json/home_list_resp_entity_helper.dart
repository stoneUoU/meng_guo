import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';

homeListRespEntityFromJson(HomeListRespEntity data, Map<String, dynamic> json) {
	if (json['pageData'] != null) {
		data.pageData = (json['pageData'] as List).map((v) => HomeListDataEntity().fromJson(v)).toList();
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
	return data;
}

Map<String, dynamic> homeListRespEntityToJson(HomeListRespEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pageData'] =  entity.pageData?.map((v) => v.toJson())?.toList();
	data['currentPage'] = entity.currentPage;
	data['perPage'] = entity.perPage;
	data['firstPageUrl'] = entity.firstPageUrl;
	data['nextPageUrl'] = entity.nextPageUrl;
	data['prePageUrl'] = entity.prePageUrl;
	data['pageLength'] = entity.pageLength;
	data['totalCount'] = entity.totalCount;
	data['totalPage'] = entity.totalPage;
	return data;
}

homeListDataEntityFromJson(HomeListDataEntity data, Map<String, dynamic> json) {
	if (json['threadId'] != null) {
		data.threadId = json['threadId'] is String
				? int.tryParse(json['threadId'])
				: json['threadId'].toInt();
	}
	if (json['postId'] != null) {
		data.postId = json['postId'] is String
				? int.tryParse(json['postId'])
				: json['postId'].toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['parentCategoryId'] != null) {
		data.parentCategoryId = json['parentCategoryId'] is String
				? int.tryParse(json['parentCategoryId'])
				: json['parentCategoryId'].toInt();
	}
	if (json['topicId'] != null) {
		data.topicId = json['topicId'] is String
				? int.tryParse(json['topicId'])
				: json['topicId'].toInt();
	}
	if (json['categoryName'] != null) {
		data.categoryName = json['categoryName'].toString();
	}
	if (json['parentCategoryName'] != null) {
		data.parentCategoryName = json['parentCategoryName'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['viewCount'] != null) {
		data.viewCount = json['viewCount'] is String
				? int.tryParse(json['viewCount'])
				: json['viewCount'].toInt();
	}
	if (json['isApproved'] != null) {
		data.isApproved = json['isApproved'] is String
				? int.tryParse(json['isApproved'])
				: json['isApproved'].toInt();
	}
	if (json['isStick'] != null) {
		data.isStick = json['isStick'];
	}
	if (json['isDraft'] != null) {
		data.isDraft = json['isDraft'];
	}
	if (json['isSite'] != null) {
		data.isSite = json['isSite'];
	}
	if (json['isAnonymous'] != null) {
		data.isAnonymous = json['isAnonymous'];
	}
	if (json['isFavorite'] != null) {
		data.isFavorite = json['isFavorite'];
	}
	if (json['price'] != null) {
		data.price = json['price'] is String
				? double.tryParse(json['price'])
				: json['price'].toDouble();
	}
	if (json['payType'] != null) {
		data.payType = json['payType'] is String
				? double.tryParse(json['payType'])
				: json['payType'].toDouble();
	}
	if (json['paid'] != null) {
		data.paid = json['paid'];
	}
	if (json['isLike'] != null) {
		data.isLike = json['isLike'];
	}
	if (json['isReward'] != null) {
		data.isReward = json['isReward'];
	}
	if (json['issueAt'] != null) {
		data.issueAt = json['issueAt'].toString();
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt'].toString();
	}
	if (json['updatedAt'] != null) {
		data.updatedAt = json['updatedAt'].toString();
	}
	if (json['diffTime'] != null) {
		data.diffTime = json['diffTime'].toString();
	}
	if (json['freewords'] != null) {
		data.freewords = json['freewords'] is String
				? double.tryParse(json['freewords'])
				: json['freewords'].toDouble();
	}
	if (json['userStickStatus'] != null) {
		data.userStickStatus = json['userStickStatus'];
	}
	if (json['user'] != null) {
		data.user = HomeListDataUserEntity().fromJson(json['user']);
	}
	if (json['group'] != null) {
		data.group = HomeListDataGroupEntity().fromJson(json['group']);
	}
	if (json['content'] != null) {
		data.content = HomeListContentEntity().fromJson(json['content']);
	}
	if (json['likeReward'] != null) {
		data.likeReward = HomeLikeEntity().fromJson(json['likeReward']);
	}
	return data;
}

Map<String, dynamic> homeListDataEntityToJson(HomeListDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['threadId'] = entity.threadId;
	data['postId'] = entity.postId;
	data['userId'] = entity.userId;
	data['parentCategoryId'] = entity.parentCategoryId;
	data['topicId'] = entity.topicId;
	data['categoryName'] = entity.categoryName;
	data['parentCategoryName'] = entity.parentCategoryName;
	data['title'] = entity.title;
	data['viewCount'] = entity.viewCount;
	data['isApproved'] = entity.isApproved;
	data['isStick'] = entity.isStick;
	data['isDraft'] = entity.isDraft;
	data['isSite'] = entity.isSite;
	data['isAnonymous'] = entity.isAnonymous;
	data['isFavorite'] = entity.isFavorite;
	data['price'] = entity.price;
	data['payType'] = entity.payType;
	data['paid'] = entity.paid;
	data['isLike'] = entity.isLike;
	data['isReward'] = entity.isReward;
	data['issueAt'] = entity.issueAt;
	data['createdAt'] = entity.createdAt;
	data['updatedAt'] = entity.updatedAt;
	data['diffTime'] = entity.diffTime;
	data['freewords'] = entity.freewords;
	data['userStickStatus'] = entity.userStickStatus;
	data['user'] = entity.user?.toJson();
	data['group'] = entity.group?.toJson();
	data['content'] = entity.content?.toJson();
	data['likeReward'] = entity.likeReward?.toJson();
	return data;
}

homeListDataUserEntityFromJson(HomeListDataUserEntity data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	if (json['threadCount'] != null) {
		data.threadCount = json['threadCount'] is String
				? int.tryParse(json['threadCount'])
				: json['threadCount'].toInt();
	}
	if (json['followCount'] != null) {
		data.followCount = json['followCount'] is String
				? int.tryParse(json['followCount'])
				: json['followCount'].toInt();
	}
	if (json['fansCount'] != null) {
		data.fansCount = json['fansCount'] is String
				? int.tryParse(json['fansCount'])
				: json['fansCount'].toInt();
	}
	if (json['questionCount'] != null) {
		data.questionCount = json['questionCount'] is String
				? int.tryParse(json['questionCount'])
				: json['questionCount'].toInt();
	}
	if (json['isRealName'] != null) {
		data.isRealName = json['isRealName'];
	}
	if (json['joinedAt'] != null) {
		data.joinedAt = json['joinedAt'].toString();
	}
	return data;
}

Map<String, dynamic> homeListDataUserEntityToJson(HomeListDataUserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['nickname'] = entity.nickname;
	data['avatar'] = entity.avatar;
	data['threadCount'] = entity.threadCount;
	data['followCount'] = entity.followCount;
	data['fansCount'] = entity.fansCount;
	data['questionCount'] = entity.questionCount;
	data['isRealName'] = entity.isRealName;
	data['joinedAt'] = entity.joinedAt;
	return data;
}

homeListDataGroupEntityFromJson(HomeListDataGroupEntity data, Map<String, dynamic> json) {
	if (json['groupIcon'] != null) {
		data.groupIcon = json['groupIcon'].toString();
	}
	if (json['groupId'] != null) {
		data.groupId = json['groupId'] is String
				? int.tryParse(json['groupId'])
				: json['groupId'].toInt();
	}
	if (json['groupName'] != null) {
		data.groupName = json['groupName'].toString();
	}
	if (json['isDisplay'] != null) {
		data.isDisplay = json['isDisplay'];
	}
	return data;
}

Map<String, dynamic> homeListDataGroupEntityToJson(HomeListDataGroupEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['groupIcon'] = entity.groupIcon;
	data['groupId'] = entity.groupId;
	data['groupName'] = entity.groupName;
	data['isDisplay'] = entity.isDisplay;
	return data;
}

homeListContentEntityFromJson(HomeListContentEntity data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text'].toString();
	}
	if (json['tags'] != null) {
		data.tags = (json['tags'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['indexes'] != null) {
		data.indexes = json['indexes'];
	}
	return data;
}

Map<String, dynamic> homeListContentEntityToJson(HomeListContentEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['tags'] = entity.tags;
	data['indexes'] = entity.indexes;
	return data;
}

homeContentImageRealEntityFromJson(HomeContentImageRealEntity data, Map<String, dynamic> json) {
	if (json['tomId'] != null) {
		data.tomId = json['tomId'] is String
				? int.tryParse(json['tomId'])
				: json['tomId'].toInt();
	}
	if (json['operation'] != null) {
		data.operation = json['operation'].toString();
	}
	if (json['body'] != null) {
		data.body = (json['body'] as List).map((v) => HomeContentImageBodyEntity().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> homeContentImageRealEntityToJson(HomeContentImageRealEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tomId'] = entity.tomId;
	data['operation'] = entity.operation;
	data['body'] =  entity.body?.map((v) => v.toJson())?.toList();
	return data;
}

homeContentImageBodyEntityFromJson(HomeContentImageBodyEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	return data;
}

Map<String, dynamic> homeContentImageBodyEntityToJson(HomeContentImageBodyEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['url'] = entity.url;
	return data;
}

homeLikeEntityFromJson(HomeLikeEntity data, Map<String, dynamic> json) {
	if (json['likePayCount'] != null) {
		data.likePayCount = json['likePayCount'] is String
				? int.tryParse(json['likePayCount'])
				: json['likePayCount'].toInt();
	}
	if (json['postCount'] != null) {
		data.postCount = json['postCount'] is String
				? int.tryParse(json['postCount'])
				: json['postCount'].toInt();
	}
	if (json['shareCount'] != null) {
		data.shareCount = json['shareCount'] is String
				? int.tryParse(json['shareCount'])
				: json['shareCount'].toInt();
	}
	return data;
}

Map<String, dynamic> homeLikeEntityToJson(HomeLikeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['likePayCount'] = entity.likePayCount;
	data['postCount'] = entity.postCount;
	data['shareCount'] = entity.shareCount;
	return data;
}