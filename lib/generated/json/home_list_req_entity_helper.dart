import 'package:meng_guo/function/home/entity/home_list_req_entity.dart';

homeListReqEntityFromJson(HomeListReqEntity data, Map<String, dynamic> json) {
  if (json['perPage'] != null) {
    data.perPage = json['perPage'] is String
        ? int.tryParse(json['perPage'])
        : json['perPage'].toInt();
  }
  if (json['page'] != null) {
    data.page = json['page'] is String
        ? int.tryParse(json['page'])
        : json['page'].toInt();
  }
  return data;
}

Map<String, dynamic> homeListReqEntityToJson(HomeListReqEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['perPage'] = entity.perPage;
  data['page'] = entity.page;
  return data;
}
