import 'package:menghabit/menghabit.dart';
import 'package:flutter/material.dart';
import 'package:menghabit/tool/base/extensions/number_extension.dart';
import 'package:menghabit/tool/constants/http_constants.dart';

class UserConfig {
  /// 当前用户是否登录
  static ValueNotifier<bool> isLogin = ValueNotifier(false);

  ///当前登录的用户ID
  static ValueNotifier<int> loginUserCode = ValueNotifier(0);

  ///
  /// 判断当前用户是否登录
  ///
  static bool judgeUserIsLogin() {
    return loginUserCode.value.isNotNullOrZero();
  }

  ///
  /// 获取当前用户ID
  ///
  static int getCurrentUserCode() {
    return loginUserCode.value;
  }

  ///
  /// 设置账号信息
  /// Param [userCode]  用户唯一ID
  /// Param [token]     用户认证信息
  ///
  static void setUserCode(int? userCode, String? token) {
    UserConfig.loginUserCode.value = userCode ?? 0;
    authorizationStr = token;
    if (!token.isNullOrEmpty()) {
      isLogin.value = true;
    }
  }
}
