import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/common/utils/hi_cache.dart';
import 'package:meng_guo/config/user_config.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_detail_page.dart';
import 'package:meng_guo/function/luanch/pages/splash_ad_page.dart';
import 'package:meng_guo/storage/user_storage.dart';

class PrivacyPolicyPage extends StatelessWidget {
  static const String sName = "PrivacyPolicyPage";

  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            color: Colors.white,
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              child: Center(
                child: Opacity(
                  opacity: 1.0,
                  child: _buildPolicyView(context),
                ),
              ),
            )));
  }

  Widget _buildPolicyView(BuildContext context) {
    return Container(
      width: 256,
      height: 306,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text(
                "隐私政策",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: color_FF303133,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28, 0, 28, 12),
              child: RichText(
                text: TextSpan(
                    text:
                        "     请你务必审慎阅读、充分理解\"隐私政策\"各项条款，包括但不限于：我们需要你的设备信息、操作 日志等个人信息。 \n     你可阅读",
                    style: TextStyle(
                        height: 1.5, color: color_FF303133, fontSize: 14),
                    children: [
                      TextSpan(
                          text: "《隐私政策》",
                          style: TextStyle(
                            height: 1.5,
                            color: color_FF1B65B9,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicyDetailPage.sName);
                            }),
                      TextSpan(
                          text: "了解详细信息。如果你同意，请点击\"同意\"开始接受我们的服务。",
                          style: TextStyle(
                              height: 1.6,
                              color: color_FF303133,
                              fontSize: 14)),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      width: 72,
                      height: 28,
                      decoration: new BoxDecoration(
                        border: new Border.all(
                          color: color_FF909399,
                          width: 1.0,
                        ),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(4.0)),
                      ),
                      child: Center(
                        child: Text(
                          "暂不使用",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: color_FF909399,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("退出");
                      SystemNavigator.pop();
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: 72,
                      height: 28,
                      decoration: new BoxDecoration(
                        border: new Border.all(
                          color: color_FF1B65B9,
                          width: 1.0,
                        ),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(4.0)),
                      ),
                      child: Center(
                        child: Text(
                          "同意",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: color_FF1B65B9,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      HiCache.getInstance().setBool("isAgree", true);
                      _fetchSplashAdPage(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
    );
  }

  _fetchSplashAdPage(BuildContext context) {
    LoginRespEntity? user = UserStorage.getUser();
    if (user != null) {
      UserConfig.setUserCode(
          user.userId, '${user.tokenType} ${user.accessToken}');
    }
    Navigator.pushNamed(context, SplashAdPage.sName);
  }
}
