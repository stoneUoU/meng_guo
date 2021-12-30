import 'package:meng_guo/function/login/entity/register_req_entity.dart';

registerReqEntityFromJson(RegisterReqEntity data, Map<String, dynamic> json) {
	if (json['password'] != null) {
		data.password = json['password'].toString();
	}
	if (json['passwordConfirmation'] != null) {
		data.passwordConfirmation = json['passwordConfirmation'].toString();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	return data;
}

Map<String, dynamic> registerReqEntityToJson(RegisterReqEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['password'] = entity.password;
	data['passwordConfirmation'] = entity.passwordConfirmation;
	data['username'] = entity.username;
	data['nickname'] = entity.nickname;
	return data;
}