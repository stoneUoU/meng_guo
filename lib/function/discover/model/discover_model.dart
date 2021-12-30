import 'package:meng_guo/function/discover/api/discover_api.dart';
import 'package:meng_guo/function/discover/entity/discover_toptip_resp_entity.dart';
import 'package:meng_guo/function/home/api/home_api.dart';
import 'package:meng_guo/function/home/entity/home_category_list_resp_entity.dart';
import 'package:meng_guo/function/home/entity/home_list_req_entity.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:meng_guo/net/net_extension.dart';

class DiscoverModel extends BaseModel {
  /// 发现顶部话题列表
  Future<DiscoverTopTipRespEntity> getDiscoverTopTipList() {
    return request<DiscoverTopTipRespEntity>(
      DiscoverApi.DISCOVER_TOP_LIST,
      isPost: false,
    ).check();
  }

  /// 发现底部热门话题列表
  Future<HomeListRespEntity> getDiscoverHotList() {
    return request<HomeListRespEntity>(
      DiscoverApi.DISCOVER_HOT_LIST,
      isPost: false,
    ).check();
  }
}
