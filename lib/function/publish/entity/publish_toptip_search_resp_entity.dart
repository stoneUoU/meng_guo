import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class PublishTopTipSearchRespEntity
    with JsonConvert<PublishTopTipSearchRespEntity> {
  List<TopTipPageEntity>? pageData;

  int? currentPage;

  int? perPage;

  String? firstPageUrl;

  String? nextPageUrl;

  String? prePageUrl;

  int? pageLength;

  int? totalCount;

  int? totalPage;

  bool? isNewTopic;
}

class TopTipPageEntity with JsonConvert<TopTipPageEntity> {
  int? topicId;

  int? userId;

  String? nickname;
  String? content;

  int? viewCount;

  int? threadCount;

  bool? recommended;

  String? recommendedAt;
}
