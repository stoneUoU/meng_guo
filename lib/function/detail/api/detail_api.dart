///详情接口
class DetailApi {
  static const String NORMAL_HOST = "api/v3/";

  ///https://bbs.xhui.cn/api/v3/thread.detail?threadId=13
  /// 话题详情
  static const String DETAIL_INFO = NORMAL_HOST + 'thread.detail?threadId=%d';

  /// https://bbs.xhui.cn/api/v3/posts.list?filter[thread][0]=13&page=1&perPage=300
  /// 评论列表
  static const String DETAIL_COMMENT_LIST =
      NORMAL_HOST + 'posts.list?filter[thread][0]=%d&page=1&perPage=300';
}
