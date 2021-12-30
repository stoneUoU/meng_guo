import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class RegisterReqEntity with JsonConvert<RegisterReqEntity> {
  String? password;
  String? passwordConfirmation;
  String? username;
  String? nickname;
}
