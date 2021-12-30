import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class RegisterRespEntity with JsonConvert<RegisterRespEntity> {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  bool? isMissNickname;
  int? userId;
}
