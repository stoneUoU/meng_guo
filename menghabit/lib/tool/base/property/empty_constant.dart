import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/widget/lottie_refresh_header.dart';

String networkErrorTitle = '网络异常';
String networkErrorMsg = '网络有毛病';
String networkErrorDrawable = 'assets/images/default_no_data.png';
String defaultServerNotAvailable = '服务器不可用';
String defaultEmptyDrawable = 'assets/images/default_no_data.png';
String defaultEmptyDesc = '没有更多数据';
String defaultTitle = '网络异常';
String defaultFooterNoMore = "- 我也是有底线的 -";
String defaultFooterRetry = "网络异常，点击重试";
String defaultFooterLoadMore = "加载中";
String netException = '无网络，请检查网络';
String defaultSubTitle = '网络有毛病';
String defaultReloadErrorStr = '重试';
String defaultResPackage = 'menghabit';

///设置全局缺省页初始化状态
ReloadType defaultReloadType = ReloadType.NONE;

/// 创建默认的下拉刷新样式
RefreshHeaderBuilder refreshHeaderBuilder = () {
  return RefreshHeaderWidget();
};

typedef RefreshHeaderBuilder = Header Function();
