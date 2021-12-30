import 'package:meng_guo/function/detail/api/detail_api.dart';
import 'package:meng_guo/function/detail/entity/detail_comment_resp_entity.dart';
import 'package:meng_guo/function/detail/entity/detail_info_resp_entity.dart';
import 'package:meng_guo/function/discover/api/discover_api.dart';
import 'package:meng_guo/function/discover/entity/discover_toptip_resp_entity.dart';
import 'package:menghabit/menghabit.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:meng_guo/net/net_extension.dart';

class DetailModel extends BaseModel {
  /// 话题详情
  Future<DetailListDataEntity> getTopicDetail(int threadId) {
    return request<DetailListDataEntity>(
      DetailApi.DETAIL_INFO.format([threadId]),
      isPost: false,
    ).check();
  }

  /// 话题详情评论列表
  Future<DetailCommentRespEntity> getCommentList(int threadId) {
    return request<DetailCommentRespEntity>(
      DetailApi.DETAIL_COMMENT_LIST.format([threadId]),
      isPost: false,
    ).check();
  }
}
