import 'dart:convert';

import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/generated/json/login_resp_entity_helper.dart';
import 'package:menghabit/tool/utils/sp_utils/sp_utils.dart';

class UserStorage {
  static const String _userKey = "User";

  static Future<bool> putUser(LoginRespEntity user) {
    String value = json.encode(user);
    return SpUtils.put(_userKey, value);
  }

  static LoginRespEntity? getUser() {
    String? value = SpUtils.getString(_userKey, defValue: "");
    if (value.isEmpty) {
      return null;
    }
    Map<String, dynamic> result = json.decode(value);
    // return userEntityFromJson(UserEntity(), result);
    return loginRespEntityFromJson(LoginRespEntity(), result);
  }

  static Future<bool> removeUser() {
    return SpUtils.remove(_userKey);
  }
}
