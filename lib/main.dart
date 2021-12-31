import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_unionad/flutter_unionad.dart';
import 'package:meng_guo/common/utils/hi_cache.dart';
import 'package:meng_guo/common/utils/status_bar_utils.dart';
import 'package:meng_guo/config/config.dart';
import 'package:meng_guo/config/language_config.dart';
import 'package:meng_guo/config/user_config.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_page.dart';
import 'package:meng_guo/function/luanch/pages/splash_ad_page.dart';
import 'package:meng_guo/provider/count_provider.dart';
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
      runApp(MyApp());
    });
  });

  StatusBarUtils.setUpTransparentStatusBar();
}

class MyApp extends StatelessWidget {
  bool adInit = false;
  String adVersion = "";
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _initPrivacy();
    _initRegister();
    _initPermission();
    return FutureBuilder<HiCache>(
        //进行初始化
        future: HiCache.preInit(),
        builder: (BuildContext context, AsyncSnapshot<HiCache> snapshot) {
          return OKToast(
            movingOnWindowChange: false,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => CountProvider())
              ],
              child: ScreenUtilInit(
                child: buildMaterialApp(),
              ),
            ),
          );
        });
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
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
        });
  }

  //注册穿山甲广告：
  void _initRegister() async {
    adInit = await FlutterUnionad.register(
        androidAppId: "5258165",
        //穿山甲广告 Android appid 必填
        iosAppId: "5258166",
        //穿山甲广告 ios appid 必填
        useTextureView: true,
        //使用TextureView控件播放视频,默认为SurfaceView,当有SurfaceView冲突的场景，可以使用TextureView 选填
        appName: "萌果资讯",
        //appname 必填
        allowShowNotify: true,
        //是否允许sdk展示通知栏提示 选填
        allowShowPageWhenScreenLock: true,
        //是否在锁屏场景支持展示广告落地页 选填
        debug: true,
        //是否显示debug日志
        supportMultiProcess: true,
        //是否支持多进程，true支持 选填
        directDownloadNetworkType: [
          FlutterUnionadNetCode.NETWORK_STATE_2G,
          FlutterUnionadNetCode.NETWORK_STATE_3G,
          FlutterUnionadNetCode.NETWORK_STATE_4G,
          FlutterUnionadNetCode.NETWORK_STATE_WIFI
        ]); //允许直接下载的网络状态集合 选填
    adVersion = await FlutterUnionad.getSDKVersion();
  }

  //隐私权限
  void _initPrivacy() async {
    if (Platform.isAndroid) {
      await FlutterUnionad.andridPrivacy(
        isCanUseLocation: false,
        //是否允许SDK主动使用地理位置信息 true可以获取，false禁止获取。默认为true
        lat: 1.0,
        //当isCanUseLocation=false时，可传入地理位置信息，穿山甲sdk使用您传入的地理位置信息lat
        lon: 1.0,
        //当isCanUseLocation=false时，可传入地理位置信息，穿山甲sdk使用您传入的地理位置信息lon
        isCanUsePhoneState: false,
        //是否允许SDK主动使用手机硬件参数，如：imei
        imei: "123",
        //当isCanUsePhoneState=false时，可传入imei信息，穿山甲sdk使用您传入的imei信息
        isCanUseWifiState: false,
        //是否允许SDK主动使用ACCESS_WIFI_STATE权限
        isCanUseWriteExternal: false,
        //是否允许SDK主动使用WRITE_EXTERNAL_STORAGE权限
        oaid: "111", //开发者可以传入oaid
      );
    }
  }

  void _initPermission() {
    FlutterUnionad.requestPermissionIfNecessary(
      callBack: FlutterUnionadPermissionCallBack(
        notDetermined: () {
          print("main_权限未确定");
        },
        restricted: () {
          print("main_权限限制");
        },
        denied: () {
          print("main_权限拒绝");
        },
        authorized: () {
          print("main_权限同意");
        },
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
  // return isAgree ? AdPage.sName : PrivacyPolicyPage.sName;
  // return isAgree ? MengGuoHomeIndexPage.sName : PrivacyPolicyPage.sName;
  return isAgree ? SplashAdPage.sName : PrivacyPolicyPage.sName;
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
