import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/function/detail/page/detail_page.dart';
import 'package:meng_guo/function/discover/pages/discover_page.dart';
import 'package:meng_guo/function/home/pages/home_page.dart';
import 'package:meng_guo/function/login/pages/login_page.dart';
import 'package:meng_guo/function/login/pages/register_page.dart';
import 'package:meng_guo/function/luanch/pages/init_register_page.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_detail_page.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_page.dart';
import 'package:meng_guo/function/luanch/pages/splash_ad_page.dart';
import 'package:meng_guo/function/luanch/pages/user_agreement_page.dart';
import 'package:meng_guo/function/message/pages/message_page.dart';
import 'package:meng_guo/function/my/pages/my_about_page.dart';
import 'package:meng_guo/function/my/pages/my_draft_page.dart';
import 'package:meng_guo/function/my/pages/my_message_page.dart';
import 'package:meng_guo/function/my/pages/my_page.dart';
import 'package:meng_guo/function/my/pages/my_setting_page.dart';
import 'package:meng_guo/function/my/pages/my_store_page.dart';
import 'package:meng_guo/function/my/viewmodel/my_view_model.dart';
import 'package:meng_guo/function/publish/page/publish_page.dart';
import 'package:meng_guo/function/publish/page/publish_toptip_search_page.dart';
import 'package:meng_guo/meng_guo_home_index_page.dart';

class MengGuoRouterGenerate {
  MaterialPageRoute fetchRouter(String? name, Object? arguments) {
    if (name?.indexOf("?") != 1) {
      final routerName = name?.split("?")[0];
      if (routerName == MengGuoHomeIndexPage.sName) {
        return MaterialPageRoute(builder: (context) => MengGuoHomeIndexPage());
      } else if (routerName == HomePage.sName) {
        return MaterialPageRoute(builder: (context) => HomePage());
      } else if (routerName == DiscoverPage.sName) {
        return MaterialPageRoute(builder: (context) => DiscoverPage());
      } else if (routerName == MessagePage.sName) {
        return MaterialPageRoute(builder: (context) => MessagePage());
      } else if (routerName == MyPage.sName) {
        return MaterialPageRoute(builder: (context) => MyPage());
      } else if (routerName == RegisterPage.sName) {
        return CustomMaterialPageRoute(builder: (context) => RegisterPage());
      } else if (routerName == DetailPage.sName) {
        return CustomMaterialPageRoute(
            builder: (context) => DetailPage(threadId: arguments as int));
      } else if (routerName == PublishPage.sName) {
        return MaterialPageRoute(
            fullscreenDialog: true, builder: (context) => PublishPage());
      } else if (routerName == PublishTopTipPage.sName) {
        return CustomMaterialPageRoute(
            builder: (context) => PublishTopTipPage());
      } else if (routerName == MyStorePage.sName) {
        return CustomMaterialPageRoute(builder: (context) => MyStorePage());
      } else if (routerName == MyDraftPage.sName) {
        return CustomMaterialPageRoute(builder: (context) => MyDraftPage());
      } else if (routerName == MyMessagePage.sName) {
        return CustomMaterialPageRoute(builder: (context) => MyMessagePage());
      } else if (routerName == PrivacyPolicyPage.sName) {
        return CustomMaterialPageRoute(
            builder: (context) => PrivacyPolicyPage());
      } else if (routerName == SplashAdPage.sName) {
        return CustomMaterialPageRoute(builder: (context) => SplashAdPage());
      } else if (routerName == PrivacyPolicyDetailPage.sName) {
        return CustomMaterialPageRoute(
            builder: (context) => PrivacyPolicyDetailPage());
      } else if (routerName == InitRegisterPage.sName) {
        return CustomMaterialPageRoute(
            builder: (context) => InitRegisterPage());
      } else if (routerName == MySettingPage.sName) {
        return CustomMaterialPageRoute(
            builder: (context) => MySettingPage(
                  myViewModel: arguments as MyViewModel,
                ));
      } else if (routerName == MyAboutPage.sName) {
        return CustomMaterialPageRoute(builder: (context) => MyAboutPage());
      } else if (routerName == UserAgreementPage.sName) {
        return CustomMaterialPageRoute(
            builder: (context) => UserAgreementPage());
      } else {
        return CustomMaterialPageRoute(builder: (context) => LoginPage());
      }
    }

    return MaterialPageRoute(builder: (context) => Container());
  }
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
