import 'package:meng_guo/function/publish/entity/image_resp_entity.dart';

imageRespEntityFromJson(ImageRespEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['order'] != null) {
    data.order = json['order'] is String
        ? int.tryParse(json['order'])
        : json['order'].toInt();
  }
  if (json['type'] != null) {
    data.type = json['type'] is String
        ? int.tryParse(json['type'])
        : json['type'].toInt();
  }
  if (json['isApproved'] != null) {
    data.isApproved = json['isApproved'] is String
        ? int.tryParse(json['isApproved'])
        : json['isApproved'].toInt();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['attachment'] != null) {
    data.attachment = json['attachment'].toString();
  }
  if (json['extension'] != null) {
    data.extension = json['extension'].toString();
  }
  if (json['fileName'] != null) {
    data.fileName = json['fileName'].toString();
  }
  if (json['filePath'] != null) {
    data.filePath = json['filePath'].toString();
  }
  if (json['fileSize'] != null) {
    data.fileSize = json['fileSize'].toString();
  }
  if (json['fileType'] != null) {
    data.fileType = json['fileType'].toString();
  }
  if (json['fileWidth'] != null) {
    data.fileWidth = json['fileWidth'] is String
        ? int.tryParse(json['fileWidth'])
        : json['fileWidth'].toInt();
  }
  if (json['fileHeight'] != null) {
    data.fileHeight = json['fileHeight'] is String
        ? int.tryParse(json['fileHeight'])
        : json['fileHeight'].toInt();
  }
  if (json['thumbUrl'] != null) {
    data.thumbUrl = json['thumbUrl'].toString();
  }
  return data;
}

Map<String, dynamic> imageRespEntityToJson(ImageRespEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['order'] = entity.order;
  data['type'] = entity.type;
  data['isApproved'] = entity.isApproved;
  data['url'] = entity.url;
  data['attachment'] = entity.attachment;
  data['extension'] = entity.extension;
  data['fileName'] = entity.fileName;
  data['filePath'] = entity.filePath;
  data['fileSize'] = entity.fileSize;
  data['fileType'] = entity.fileType;
  data['fileWidth'] = entity.fileWidth;
  data['fileHeight'] = entity.fileHeight;
  data['thumbUrl'] = entity.thumbUrl;
  return data;
}
