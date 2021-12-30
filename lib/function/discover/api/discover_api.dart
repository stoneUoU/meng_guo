///发现接口
class DiscoverApi {
  static const String NORMAL_HOST = "api/v3/";

  ///https://bbs.xhui.cn/api/v3/topics.list?filter[hot]=1&filter[content]=&perPage=10&page=1
  /// 发现顶部话题列表
  static const String DISCOVER_TOP_LIST = NORMAL_HOST +
      'topics.list?filter[hot]=1&filter[content]=&perPage=10&page=1';

  /// https://bbs.xhui.cn/api/v3/thread.list?perPage=10&page=1&filter[search]=&scope=2
  /// 发现热门列表
  static const String DISCOVER_HOT_LIST =
      NORMAL_HOST + 'thread.list?perPage=10&page=1&filter[search]=&scope=2';
}
