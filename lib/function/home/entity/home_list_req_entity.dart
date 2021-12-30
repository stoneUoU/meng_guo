import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class HomeListReqEntity with JsonConvert<HomeListReqEntity> {
  /// 列表所属模块域 0:普通 1：推荐 2：付费首页 3：搜索页
  // String? scope;

  /// 分类组合（需要查询的分类id集合）
  // List<int>? categoryids;

  /// 每页数量
  int perPage = 10;

  /// 当前页
  int page = 1;
}
