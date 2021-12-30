///发现接口
class MyApi {
  static const String NORMAL_HOST = "api/v3/";

  /// 个人中心
  static const String MY_HOME_INFO = NORMAL_HOST + 'user?userId=%d';

  /// 我的主题列表
  static const String MY_HOME_LIST = NORMAL_HOST +
      'thread.list?perPage=10&page=1&filter[toUserId]=0&filter[complex]=5&scope=0';
}
