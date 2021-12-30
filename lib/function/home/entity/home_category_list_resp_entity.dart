import 'package:meng_guo/generated/json/base/json_convert_content.dart';

class HomeCategoryListRespEntity with JsonConvert<HomeCategoryListRespEntity> {
  int? pid;

  ///分类id
  int? categoryId;

  ///分类名称
  String? name;

  ///描述
  String? description;

  ///分类图标
  String? icon;

  ///序号
  int? sort;

  ///属性,0 正常 1 首页展示
  int? property;

  ///帖子数量
  int? threadCount;

  ///父级分类id
  int? parentid;

  ///该分类是否能发帖
  bool? canCreateThread;

  ///可搜索的子分类
  List<int>? searchIds;

  ///子分类
  List<HomeCategorySubItemEntity>? children;
}

class HomeCategorySubItemEntity with JsonConvert<HomeCategorySubItemEntity> {
  ///分类id
  int? categoryId;

  ///分类名称
  String? name;

  ///父级分类id
  int? parentid;

  ///该分类是否能发帖
  bool? canCreateThread;

  ///帖子数量
  int? threadCount;

  ///序号
  int? sort;
}
