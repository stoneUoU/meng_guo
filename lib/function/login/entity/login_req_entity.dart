import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class LoginReqEntity with JsonConvert<LoginReqEntity> {
  String? password;
  String? username;
  bool isCheckAgreement = false;
}
