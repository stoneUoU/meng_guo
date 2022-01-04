import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/widget/common_highlight_icon_button.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_detail_page.dart';
import 'package:meng_guo/function/luanch/pages/user_agreement_page.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/utils/screen_utils.dart';
import 'package:package_info/package_info.dart';

class MyAboutPage extends StatefulWidget {
  static const String sName = "MyAboutPage";

  const MyAboutPage({Key? key}) : super(key: key);

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build MyAboutPage');
    return Scaffold(
      body: Column(children: [
        MyAboutNavigationWidget(context: context),
        Expanded(
            child: MyAboutBodyWidget(
          context: context,
          packageInfo: this._packageInfo,
        )),
        Container(
            height: 72.px,
            width: ScreenUtils.screenW(),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(text: "", children: [
                TextSpan(
                    text: "《用户注册协议》",
                    style: TextStyle(
                      height: 1.5,
                      color: color_FF1B65B9,
                      fontSize: 12.px,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, UserAgreementPage.sName);
                      }),
                TextSpan(
                    text: "《隐私政策》",
                    style: TextStyle(
                      height: 1.5,
                      color: color_FF1B65B9,
                      fontSize: 12.px,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context, PrivacyPolicyDetailPage.sName);
                      }),
              ]),
            )),
        Container(height: ScreenUtils.padBotH(), width: ScreenUtils.screenW()),
      ]),
    );
  }
}

class MyAboutNavigationWidget extends StatelessWidget {
  const MyAboutNavigationWidget({Key? key, required this.context})
      : super(key: key);
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.screenW(),
      height: ScreenUtils.navigationBarHeight(),
      color: Colors.white,
      child: Column(
        children: [
          Container(
              width: ScreenUtils.screenW(), height: ScreenUtils.padTopH()),
          Stack(children: [
            Container(
                width: ScreenUtils.screenW(),
                height: kToolbarHeight,
                alignment: Alignment.center,
                child: Text("关于",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            Positioned(
                child: CommonHighLightIconButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  iconSize: Size(28.px, 28.px),
                  imageName: 'assets/images/common/common_icon_back_dark.png',
                  iconColor: Colors.black,
                ),
                left: 16,
                top: 12)
          ])
        ],
      ),
    );
  }
}

class MyAboutBodyWidget extends StatelessWidget {
  final PackageInfo packageInfo;
  const MyAboutBodyWidget(
      {Key? key, required this.context, required this.packageInfo})
      : super(key: key);
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.screenW(),
      margin: EdgeInsets.only(top: 108.px),
      child: Column(
        children: [
          Container(
            child: Container(
                width: 72.px,
                height: 72.px,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.px),
                  child: Image.asset("assets/images/common/app_logo.png"),
                )),
          ),
          Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "萌果资讯",
                style: TextStyle(
                  color: color_FF303133,
                  fontSize: 18.px,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "版本号：${packageInfo.version}",
                style: TextStyle(
                  color: color_FF303133,
                  fontSize: 15.px,
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
