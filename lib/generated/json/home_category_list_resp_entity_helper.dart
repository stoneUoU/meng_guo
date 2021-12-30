import 'package:meng_guo/function/home/entity/home_category_list_resp_entity.dart';

homeCategoryListRespEntityFromJson(HomeCategoryListRespEntity data, Map<String, dynamic> json) {
	if (json['pid'] != null) {
		data.pid = json['pid'] is String
				? int.tryParse(json['pid'])
				: json['pid'].toInt();
	}
	if (json['categoryId'] != null) {
		data.categoryId = json['categoryId'] is String
				? int.tryParse(json['categoryId'])
				: json['categoryId'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['sort'] != null) {
		data.sort = json['sort'] is String
				? int.tryParse(json['sort'])
				: json['sort'].toInt();
	}
	if (json['property'] != null) {
		data.property = json['property'] is String
				? int.tryParse(json['property'])
				: json['property'].toInt();
	}
	if (json['threadCount'] != null) {
		data.threadCount = json['threadCount'] is String
				? int.tryParse(json['threadCount'])
				: json['threadCount'].toInt();
	}
	if (json['parentid'] != null) {
		data.parentid = json['parentid'] is String
				? int.tryParse(json['parentid'])
				: json['parentid'].toInt();
	}
	if (json['canCreateThread'] != null) {
		data.canCreateThread = json['canCreateThread'];
	}
	if (json['searchIds'] != null) {
		data.searchIds = (json['searchIds'] as List).map((v) => v is String
				? int.tryParse(v)
				: v.toInt()).toList().cast<int>();
	}
	if (json['children'] != null) {
		data.children = (json['children'] as List).map((v) => HomeCategorySubItemEntity().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> homeCategoryListRespEntityToJson(HomeCategoryListRespEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pid'] = entity.pid;
	data['categoryId'] = entity.categoryId;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['icon'] = entity.icon;
	data['sort'] = entity.sort;
	data['property'] = entity.property;
	data['threadCount'] = entity.threadCount;
	data['parentid'] = entity.parentid;
	data['canCreateThread'] = entity.canCreateThread;
	data['searchIds'] = entity.searchIds;
	data['children'] =  entity.children?.map((v) => v.toJson())?.toList();
	return data;
}

homeCategorySubItemEntityFromJson(HomeCategorySubItemEntity data, Map<String, dynamic> json) {
	if (json['categoryId'] != null) {
		data.categoryId = json['categoryId'] is String
				? int.tryParse(json['categoryId'])
				: json['categoryId'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['parentid'] != null) {
		data.parentid = json['parentid'] is String
				? int.tryParse(json['parentid'])
				: json['parentid'].toInt();
	}
	if (json['canCreateThread'] != null) {
		data.canCreateThread = json['canCreateThread'];
	}
	if (json['threadCount'] != null) {
		data.threadCount = json['threadCount'] is String
				? int.tryParse(json['threadCount'])
				: json['threadCount'].toInt();
	}
	if (json['sort'] != null) {
		data.sort = json['sort'] is String
				? int.tryParse(json['sort'])
				: json['sort'].toInt();
	}
	return data;
}

Map<String, dynamic> homeCategorySubItemEntityToJson(HomeCategorySubItemEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['categoryId'] = entity.categoryId;
	data['name'] = entity.name;
	data['parentid'] = entity.parentid;
	data['canCreateThread'] = entity.canCreateThread;
	data['threadCount'] = entity.threadCount;
	data['sort'] = entity.sort;
	return data;
}