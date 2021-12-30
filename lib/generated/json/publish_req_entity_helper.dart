import 'package:meng_guo/function/publish/entity/publish_req_entity.dart';

publishReqEntityFromJson(PublishReqEntity data, Map<String, dynamic> json) {
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['categoryId'] != null) {
    data.categoryId = json['categoryId'] is String
        ? int.tryParse(json['categoryId'])
        : json['categoryId'].toInt();
  }
  if (json['content'] != null) {
    data.content = PublishInfoRespEntity().fromJson(json['content']);
  }
  return data;
}

Map<String, dynamic> publishReqEntityToJson(PublishReqEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['title'] = entity.title;
  data['categoryId'] = entity.categoryId;
  data['content'] = entity.content.toJson();
  return data;
}

publishInfoRespEntityFromJson(
    PublishInfoRespEntity data, Map<String, dynamic> json) {
  if (json['text'] != null) {
    data.text = json['text'].toString();
  }
  if (json['tags'] != null) {
    data.tags =
        (json['tags'] as List).map((v) => v.toString()).toList().cast<String>();
  }
  if (json['indexes'] != null) {
    data.indexes = json['indexes'];
  }
  return data;
}

Map<String, dynamic> publishInfoRespEntityToJson(PublishInfoRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['text'] = entity.text;
  data['tags'] = entity.tags;
  data['indexes'] = entity.indexes;
  return data;
}
