import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class LoginRespEntity with JsonConvert<LoginRespEntity> {
  int? userId;

  String? avatarUrl;

  int? userStatus;

  String? tokenType;

  int? uid;

  /// 过期时间(秒)
  int? expiresIn;

  String? accessToken;

  String? refreshToken;
}
