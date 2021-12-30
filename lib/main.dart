import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meng_guo/common/utils/hi_cache.dart';
import 'package:meng_guo/common/utils/status_bar_utils.dart';
import 'package:meng_guo/config/config.dart';
import 'package:meng_guo/config/language_config.dart';
import 'package:meng_guo/config/user_config.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_page.dart';
import 'package:meng_guo/meng_guo_home_index_page.dart';
import 'package:meng_guo/router/router_generate.dart';
import 'package:meng_guo/router/router_observer.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/property/empty_constant.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/localizetion/ChineseCupertinoLocalizations.dart';
import 'package:menghabit/tool/widget/screen/screenutil_init.dart';
import 'package:oktoast/oktoast.dart';

import 'generated/l10n.dart';

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}

void main() async {
  await Config.dispatchRunMainBefore().then((value) {
    Future.delayed(const Duration(milliseconds: 500), () {
      runApp(const MyApp());
    });
  });

  StatusBarUtils.setUpTransparentStatusBar();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      movingOnWindowChange: false,
      child: ScreenUtilInit(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              ChineseCupertinoLocalizations.delegate,
            ],
            navigatorKey: NavKey.navKey,
            supportedLocales: [
              Locale(LanguageConfig.currentLanguage, ''),
            ],
            theme: ThemeData(
              primarySwatch: Colors.blue,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),
            onGenerateTitle: generateAppLanguage(this, "", initEmpty),
            navigatorObservers: [routeObserver],
            initialRoute: fetchLogin(),
            onGenerateRoute: (RouteSettings settings) {
              String? name = settings.name;
              Object? object = settings.arguments;
              return MengGuoRouterGenerate().fetchRouter(name, object);
            }),
      ),
    );
  }
}

String fetchLogin() {
  bool isAgree = HiCache.getInstance().get("isAgree") == null
      ? false
      : HiCache.getInstance().get("isAgree") as bool;

  LoginRespEntity? user = UserStorage.getUser();
  if (user != null) {
    UserConfig.setUserCode(
        user.userId, '${user.tokenType} ${user.accessToken}');
  }
  return isAgree ? MengGuoHomeIndexPage.sName : PrivacyPolicyPage.sName;
}

///初始化缺省页国际化文案
void initEmpty(BuildContext context) {
  var currentLanguage = getLanguage<S>();
  networkErrorTitle = currentLanguage.common_no_network_title;
  networkErrorMsg = currentLanguage.common_error_net_no_data;
  defaultTitle = currentLanguage.common_empty_data;
  defaultSubTitle = currentLanguage.common_empty_sub_data;
  defaultReloadErrorStr = currentLanguage.common_retry;
  defaultEmptyDesc = currentLanguage.common_empty_data;
  defaultReloadType = ReloadType.NET_ERROR;
  networkErrorDrawable = "assets/images/default_no_network.png";
  defaultFooterNoMore = currentLanguage.common_load_no_more2;
  defaultFooterLoadMore = currentLanguage.common_load_more;
  defaultFooterRetry = currentLanguage.common_footer_retry;
  defaultReloadType = ReloadType.NET_ERROR;
}
