import 'package:meng_guo/function/login/entity/register_resp_entity.dart';

registerRespEntityFromJson(RegisterRespEntity data, Map<String, dynamic> json) {
  if (json['accessToken'] != null) {
    data.accessToken = json['accessToken'].toString();
  }
  if (json['tokenType'] != null) {
    data.tokenType = json['tokenType'].toString();
  }
  if (json['refreshToken'] != null) {
    data.refreshToken = json['refreshToken'].toString();
  }
  if (json['isMissNickname'] != null) {
    data.isMissNickname = json['isMissNickname'];
  }
  if (json['userId'] != null) {
    data.userId = json['userId'] is String
        ? int.tryParse(json['userId'])
        : json['userId'].toInt();
  }
  return data;
}

Map<String, dynamic> registerRespEntityToJson(RegisterRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['accessToken'] = entity.accessToken;
  data['tokenType'] = entity.tokenType;
  data['refreshToken'] = entity.refreshToken;
  data['isMissNickname'] = entity.isMissNickname;
  data['userId'] = entity.userId;
  return data;
}
