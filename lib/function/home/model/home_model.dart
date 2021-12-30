import 'package:meng_guo/function/home/api/home_api.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/home/entity/home_category_list_resp_entity.dart';
import 'package:meng_guo/function/home/entity/home_list_req_entity.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:meng_guo/net/net_extension.dart';

class HomeModel extends BaseModel {
  /// 首页分类tab列表
  Future<List<HomeCategoryListRespEntity>> getHomeCategoryTabList() {
    return request<List<HomeCategoryListRespEntity>>(
      HomeApi.HOME_CATEGORY_LIST,
      isPost: false,
    ).check();
  }

  /// 首页分类tab下子列表
  Future<HomeListRespEntity> getHomeList(HomeListReqEntity reqEntity) {
    return request<HomeListRespEntity>(
      HomeApi.HOME_TAB_LIST,
      isPost: false,
      queryParameters: reqEntity.toJson(),
    ).check();
  }

  /// 表情列表
  Future<List<EmojiListRespEntity>?> getEmojiList() {
    return request<List<EmojiListRespEntity>?>(
      HomeApi.EMOJI_LIST,
      isPost: false,
    ).check();
  }
}
