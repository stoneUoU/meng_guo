import 'package:meng_guo/function/login/entity/login_resp_entity.dart';

loginRespEntityFromJson(LoginRespEntity data, Map<String, dynamic> json) {
  if (json['userId'] != null) {
    data.userId = json['userId'] is String
        ? int.tryParse(json['userId'])
        : json['userId'].toInt();
  }
  if (json['avatarUrl'] != null) {
    data.avatarUrl = json['avatarUrl'].toString();
  }
  if (json['userStatus'] != null) {
    data.userStatus = json['userStatus'] is String
        ? int.tryParse(json['userStatus'])
        : json['userStatus'].toInt();
  }
  if (json['tokenType'] != null) {
    data.tokenType = json['tokenType'].toString();
  }
  if (json['uid'] != null) {
    data.uid =
        json['uid'] is String ? int.tryParse(json['uid']) : json['uid'].toInt();
  }
  if (json['expiresIn'] != null) {
    data.expiresIn = json['expiresIn'] is String
        ? int.tryParse(json['expiresIn'])
        : json['expiresIn'].toInt();
  }
  if (json['accessToken'] != null) {
    data.accessToken = json['accessToken'].toString();
  }
  if (json['refreshToken'] != null) {
    data.refreshToken = json['refreshToken'].toString();
  }
  return data;
}

Map<String, dynamic> loginRespEntityToJson(LoginRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['userId'] = entity.userId;
  data['avatarUrl'] = entity.avatarUrl;
  data['userStatus'] = entity.userStatus;
  data['tokenType'] = entity.tokenType;
  data['uid'] = entity.uid;
  data['expiresIn'] = entity.expiresIn;
  data['accessToken'] = entity.accessToken;
  data['refreshToken'] = entity.refreshToken;
  return data;
}
