class MessageApi {
  static const String NORMAL_HOST = "api/v3/";

  /// 系统消息
  /// https://bbs.xhui.cn/api/v3/notification?perPage=10&page=1&filter[type]=system&dzqSid=79866589-1638844237994&dzqPf=h5
  static const String MESSAGE_SYSTEM =
      NORMAL_HOST + 'notification?perPage=10&page=%d&filter[type]=system';

  /// 帖子消息
  /// https://bbs.xhui.cn/api/v3/notification?perPage=10&page=1&filter[type]=related,replied,liked&dzqSid=79866589-1638844237994&dzqPf=h5
  static const String MESSAGE_TIP = NORMAL_HOST +
      'notification?perPage=10&page=%d&filter[type]=related,replied,liked';

  /// 我的消息
  static const String MESSAGE_MY =
      NORMAL_HOST + 'notification?perPage=10&page=%d&filter[type]=system';
}
