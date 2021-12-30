///首页接口
class HomeApi {
  static const String NORMAL_HOST = "api/v3/";

  /// 首页分类tab列表
  static const String HOME_CATEGORY_LIST = NORMAL_HOST + 'categories';

  /// 首页主题列表
  static const String HOME_TAB_LIST = NORMAL_HOST + 'thread.list';

  /// 表情列表
  static const String EMOJI_LIST = NORMAL_HOST + 'emoji';
}
