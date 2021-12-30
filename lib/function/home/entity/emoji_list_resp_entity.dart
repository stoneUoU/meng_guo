import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class EmojiListRespEntity with JsonConvert<EmojiListRespEntity> {
  int? id;
  String? category;
  String? url;
  String? code;
  String? order;
}
