import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class DiscoverTopTipRespEntity with JsonConvert<DiscoverTopTipRespEntity> {
  int? currentPage;

  String? firstPageUrl;

  String? nextPageUrl;

  int? pageLength;

  int? perPage;

  String? prePageUrl;

  int? totalCount;
  int? totalPage;

  List<DiscoverTopTipEntity>? pageData;
}

class DiscoverTopTipEntity with JsonConvert<DiscoverTopTipEntity> {
  int? topicId;

  int? userId;

  String? nickname;

  String? content;

  int? viewCount;

  int? threadCount;

  bool? recommended;
  String? recommendedAt;
}
