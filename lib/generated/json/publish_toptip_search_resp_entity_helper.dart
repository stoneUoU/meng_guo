import 'package:meng_guo/function/publish/entity/publish_toptip_search_resp_entity.dart';

publishTopTipSearchRespEntityFromJson(
    PublishTopTipSearchRespEntity data, Map<String, dynamic> json) {
  if (json['pageData'] != null) {
    data.pageData = (json['pageData'] as List)
        .map((v) => TopTipPageEntity().fromJson(v))
        .toList();
  }
  if (json['currentPage'] != null) {
    data.currentPage = json['currentPage'] is String
        ? int.tryParse(json['currentPage'])
        : json['currentPage'].toInt();
  }
  if (json['perPage'] != null) {
    data.perPage = json['perPage'] is String
        ? int.tryParse(json['perPage'])
        : json['perPage'].toInt();
  }
  if (json['firstPageUrl'] != null) {
    data.firstPageUrl = json['firstPageUrl'].toString();
  }
  if (json['nextPageUrl'] != null) {
    data.nextPageUrl = json['nextPageUrl'].toString();
  }
  if (json['prePageUrl'] != null) {
    data.prePageUrl = json['prePageUrl'].toString();
  }
  if (json['pageLength'] != null) {
    data.pageLength = json['pageLength'] is String
        ? int.tryParse(json['pageLength'])
        : json['pageLength'].toInt();
  }
  if (json['totalCount'] != null) {
    data.totalCount = json['totalCount'] is String
        ? int.tryParse(json['totalCount'])
        : json['totalCount'].toInt();
  }
  if (json['totalPage'] != null) {
    data.totalPage = json['totalPage'] is String
        ? int.tryParse(json['totalPage'])
        : json['totalPage'].toInt();
  }
  if (json['isNewTopic'] != null) {
    data.isNewTopic = json['isNewTopic'];
  }
  return data;
}

Map<String, dynamic> publishTopTipSearchRespEntityToJson(
    PublishTopTipSearchRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['pageData'] = entity.pageData?.map((v) => v.toJson())?.toList();
  data['currentPage'] = entity.currentPage;
  data['perPage'] = entity.perPage;
  data['firstPageUrl'] = entity.firstPageUrl;
  data['nextPageUrl'] = entity.nextPageUrl;
  data['prePageUrl'] = entity.prePageUrl;
  data['pageLength'] = entity.pageLength;
  data['totalCount'] = entity.totalCount;
  data['totalPage'] = entity.totalPage;
  data['isNewTopic'] = entity.isNewTopic;
  return data;
}

topTipPageEntityFromJson(TopTipPageEntity data, Map<String, dynamic> json) {
  if (json['topicId'] != null) {
    data.topicId = json['topicId'] is String
        ? int.tryParse(json['topicId'])
        : json['topicId'].toInt();
  }
  if (json['userId'] != null) {
    data.userId = json['userId'] is String
        ? int.tryParse(json['userId'])
        : json['userId'].toInt();
  }
  if (json['nickname'] != null) {
    data.nickname = json['nickname'].toString();
  }
  if (json['content'] != null) {
    data.content = json['content'].toString();
  }
  if (json['viewCount'] != null) {
    data.viewCount = json['viewCount'] is String
        ? int.tryParse(json['viewCount'])
        : json['viewCount'].toInt();
  }
  if (json['threadCount'] != null) {
    data.threadCount = json['threadCount'] is String
        ? int.tryParse(json['threadCount'])
        : json['threadCount'].toInt();
  }
  if (json['recommended'] != null) {
    data.recommended = json['recommended'];
  }
  if (json['recommendedAt'] != null) {
    data.recommendedAt = json['recommendedAt'].toString();
  }
  return data;
}

Map<String, dynamic> topTipPageEntityToJson(TopTipPageEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['topicId'] = entity.topicId;
  data['userId'] = entity.userId;
  data['nickname'] = entity.nickname;
  data['content'] = entity.content;
  data['viewCount'] = entity.viewCount;
  data['threadCount'] = entity.threadCount;
  data['recommended'] = entity.recommended;
  data['recommendedAt'] = entity.recommendedAt;
  return data;
}
