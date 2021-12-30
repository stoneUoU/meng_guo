import 'package:meng_guo/function/detail/entity/detail_info_resp_entity.dart';
import 'package:meng_guo/function/home/api/home_api.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/home/entity/home_category_list_resp_entity.dart';
import 'package:meng_guo/function/publish/entity/image_resp_entity.dart';
import 'package:meng_guo/function/publish/entity/publish_req_entity.dart';
import 'package:meng_guo/function/publish/entity/publish_toptip_search_resp_entity.dart';
import 'package:menghabit/menghabit.dart';
import 'package:meng_guo/function/home/entity/home_list_resp_entity.dart';
import 'package:meng_guo/function/publish/api/publish_api.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:meng_guo/net/net_extension.dart';

class PublishModel extends BaseModel {
  /// 表情列表
  Future<List<EmojiListRespEntity>?> getEmojiList() {
    return request<List<EmojiListRespEntity>?>(
      PublishApi.EMOJI_LIST,
      isPost: false,
    ).check();
  }

  /// 首页分类tab列表
  Future<List<HomeCategoryListRespEntity>> getHomeCategoryTabList() {
    return request<List<HomeCategoryListRespEntity>>(
      PublishApi.CATEGORY_LIST,
      isPost: false,
    ).check();
  }

  /// 搜索话题列表
  Future<PublishTopTipSearchRespEntity> searchTopTipsList(String content) {
    return request<PublishTopTipSearchRespEntity>(
      PublishApi.TOPTIPS_LIST.format([content]),
      isPost: false,
    ).check();
  }

  /// 发布
  /// 搜索话题列表
  Future<DetailListDataEntity> postPublish(PublishReqEntity reqEntity) {
    return request<DetailListDataEntity>(
      PublishApi.POST_THREAD,
      isPost: true,
      data: reqEntity.toJson(),
    ).check();
  }

  /// 上传图片
  Future<ImageRespEntity> uploadImage(String filePath) {
    return sendForm<ImageRespEntity>(PublishApi.UPLOAD_IMAGE, filePath).check();
  }
}
