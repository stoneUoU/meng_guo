import 'package:meng_guo/generated/json/base/json_convert_content.dart';
import 'package:menghabit/tool/network/entity/base_response_entity.dart';

extension NetExtension<T> on Future<BaseResponseEntity<T>> {
  Future<T> check() async {
    var baseResponseEntity = await this;
    if (baseResponseEntity.data is bool || baseResponseEntity.data is String) {
      return Future.value(baseResponseEntity.data);
    }
    return Future.value(JsonConvert.fromJsonAsT<T>(baseResponseEntity.data));
  }
}
