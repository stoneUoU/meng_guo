import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:menghabit/menghabit.dart';
import 'package:meng_guo/function/my/api/my_api.dart';
import 'package:meng_guo/function/my/entity/my_home_resp_entity.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:meng_guo/net/net_extension.dart';

class MyModel extends BaseModel {
  /// 发现顶部话题列表
  Future<MyHomeRespEntity> getMyHome(int userId) {
    return request<MyHomeRespEntity>(
      MyApi.MY_HOME_INFO.format([userId]),
      isPost: false,
    ).check();
  }

  /// 我的话题列表
  Future<HomeListRespEntity> getMyHomeList() {
    return request<HomeListRespEntity>(
      MyApi.MY_HOME_LIST,
      isPost: false,
    ).check();
  }
}
