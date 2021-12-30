import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class PublishReqEntity with JsonConvert<PublishReqEntity> {
  String? title;

  int? categoryId;

  PublishInfoRespEntity content = PublishInfoRespEntity();
}

class PublishInfoRespEntity with JsonConvert<PublishInfoRespEntity> {
  /// 帖子正文内容
  String? text;

  List<String>? tags;

  dynamic indexes;
}
