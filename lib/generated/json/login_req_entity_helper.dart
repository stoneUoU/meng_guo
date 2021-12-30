import 'package:meng_guo/function/login/entity/login_req_entity.dart';

loginReqEntityFromJson(LoginReqEntity data, Map<String, dynamic> json) {
  if (json['password'] != null) {
    data.password = json['password'].toString();
  }
  if (json['username'] != null) {
    data.username = json['username'].toString();
  }
  return data;
}

Map<String, dynamic> loginReqEntityToJson(LoginReqEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['password'] = entity.password;
  data['username'] = entity.username;
  return data;
}
