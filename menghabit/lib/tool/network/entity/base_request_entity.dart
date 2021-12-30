import 'package:menghabit/tool/base/json/json_convert_content.dart';

class BaseRequestEntity with JsonConvertUtil<BaseRequestEntity> {
  String? params;
  String? sign;
  String? timeStamp;
}
