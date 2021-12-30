import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class ImageRespEntity with JsonConvert<ImageRespEntity> {
  int? id;

  int? order;

  int? type;

  int? isApproved;

  String? url;

  String? attachment;

  String? extension;

  String? fileName;

  String? filePath;

  String? fileSize;

  String? fileType;

  int? fileWidth;

  int? fileHeight;

  String? thumbUrl;
}
