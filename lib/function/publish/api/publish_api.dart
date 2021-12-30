///首页接口
class PublishApi {
  static const String NORMAL_HOST = "api/v3/";

  /// 首页分类tab列表
  static const String CATEGORY_LIST = NORMAL_HOST + 'categories';

  /// 表情列表
  static const String EMOJI_LIST = NORMAL_HOST + 'emoji';

  /// 搜索话题
  /// https://bbs.xhui.cn/api/v3/topics.list?page=1&perPage=20&filter[content]=%E5%95%8A
  static const String TOPTIPS_LIST =
      NORMAL_HOST + 'topics.list?page=1&perPage=20&filter[content]=%s';

  /// 上传图片
  /// https://bbs.xhui.cn/api/v3/attachments?dzqSid=79866589-1638844237994&dzqPf=h5
  static const String UPLOAD_IMAGE = NORMAL_HOST + 'attachments';

  /// 发布帖子
  static const String POST_THREAD = NORMAL_HOST + 'thread.create';
}
