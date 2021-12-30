import 'package:meng_guo/function/my/entity/my_home_resp_entity.dart';

myHomeRespEntityFromJson(MyHomeRespEntity data, Map<String, dynamic> json) {
	if (json['originalAvatarUrl'] != null) {
		data.originalAvatarUrl = json['originalAvatarUrl'].toString();
	}
	if (json['backgroundUrl'] != null) {
		data.backgroundUrl = json['backgroundUrl'].toString();
	}
	if (json['originalBackGroundUrl'] != null) {
		data.originalBackGroundUrl = json['originalBackGroundUrl'].toString();
	}
	if (json['isReal'] != null) {
		data.isReal = json['isReal'];
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
	if (json['likedCount'] != null) {
		data.likedCount = json['likedCount'] is String
				? int.tryParse(json['likedCount'])
				: json['likedCount'].toInt();
	}
	if (json['questionCount'] != null) {
		data.questionCount = json['questionCount'] is String
				? int.tryParse(json['questionCount'])
				: json['questionCount'].toInt();
	}
	if (json['signature'] != null) {
		data.signature = json['signature'].toString();
	}
	if (json['usernameBout'] != null) {
		data.usernameBout = json['usernameBout'] is String
				? int.tryParse(json['usernameBout'])
				: json['usernameBout'].toInt();
	}
	if (json['updatedAt'] != null) {
		data.updatedAt = json['updatedAt'].toString();
	}
	if (json['canEdit'] != null) {
		data.canEdit = json['canEdit'];
	}
	if (json['canDelete'] != null) {
		data.canDelete = json['canDelete'];
	}
	if (json['showGroups'] != null) {
		data.showGroups = json['showGroups'];
	}
	if (json['registerReason'] != null) {
		data.registerReason = json['registerReason'].toString();
	}
	if (json['denyStatus'] != null) {
		data.denyStatus = json['denyStatus'];
	}
	if (json['hasPassword'] != null) {
		data.hasPassword = json['hasPassword'];
	}
	if (json['isRenew'] != null) {
		data.isRenew = json['isRenew'];
	}
	if (json['paid'] != null) {
		data.paid = json['paid'];
	}
	if (json['payTime'] != null) {
		data.payTime = json['payTime'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['avatarUrl'] != null) {
		data.avatarUrl = json['avatarUrl'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['loginAt'] != null) {
		data.loginAt = json['loginAt'].toString();
	}
	if (json['banReason'] != null) {
		data.banReason = json['banReason'].toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	if (json['follow'] != null) {
		data.follow = json['follow'] is String
				? int.tryParse(json['follow'])
				: json['follow'].toInt();
	}
	if (json['isDeny'] != null) {
		data.isDeny = json['isDeny'];
	}
	return data;
}

Map<String, dynamic> myHomeRespEntityToJson(MyHomeRespEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['originalAvatarUrl'] = entity.originalAvatarUrl;
	data['backgroundUrl'] = entity.backgroundUrl;
	data['originalBackGroundUrl'] = entity.originalBackGroundUrl;
	data['isReal'] = entity.isReal;
	data['threadCount'] = entity.threadCount;
	data['followCount'] = entity.followCount;
	data['fansCount'] = entity.fansCount;
	data['likedCount'] = entity.likedCount;
	data['questionCount'] = entity.questionCount;
	data['signature'] = entity.signature;
	data['usernameBout'] = entity.usernameBout;
	data['updatedAt'] = entity.updatedAt;
	data['canEdit'] = entity.canEdit;
	data['canDelete'] = entity.canDelete;
	data['showGroups'] = entity.showGroups;
	data['registerReason'] = entity.registerReason;
	data['denyStatus'] = entity.denyStatus;
	data['hasPassword'] = entity.hasPassword;
	data['isRenew'] = entity.isRenew;
	data['paid'] = entity.paid;
	data['payTime'] = entity.payTime;
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['avatarUrl'] = entity.avatarUrl;
	data['status'] = entity.status;
	data['loginAt'] = entity.loginAt;
	data['banReason'] = entity.banReason;
	data['nickname'] = entity.nickname;
	data['follow'] = entity.follow;
	data['isDeny'] = entity.isDeny;
	return data;
}