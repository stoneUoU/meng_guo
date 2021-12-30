///登录接口
class LoginApi {
  static const String NORMAL_HOST = "api/v3/users/";

  /// 用户名密码登录
  static const String LOGIN_USER_NAME = NORMAL_HOST + 'username.login';

  /// 注册
  static const String REGISTER = NORMAL_HOST + 'username.register';
}
