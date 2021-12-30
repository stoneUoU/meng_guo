import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';

emojiListRespEntityFromJson(
    EmojiListRespEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['category'] != null) {
    data.category = json['category'].toString();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['code'] != null) {
    data.code = json['code'].toString();
  }
  if (json['order'] != null) {
    data.order = json['order'].toString();
  }
  return data;
}

Map<String, dynamic> emojiListRespEntityToJson(EmojiListRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['category'] = entity.category;
  data['url'] = entity.url;
  data['code'] = entity.code;
  data['order'] = entity.order;
  return data;
}
