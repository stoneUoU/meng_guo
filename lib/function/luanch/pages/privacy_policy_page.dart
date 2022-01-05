import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meng_guo/colors/colors.dart';
import 'package:meng_guo/config/user_config.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/luanch/pages/privacy_policy_detail_page.dart';
import 'package:meng_guo/function/luanch/pages/splash_ad_page.dart';
import 'package:meng_guo/function/luanch/pages/user_agreement_page.dart';
import 'package:meng_guo/storage/user_storage.dart';
import 'package:menghabit/tool/base/extensions/screen_extension.dart';
import 'package:menghabit/tool/utils/sp_utils/sp_utils.dart';

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
      width: 256.px,
      height: 396.px,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 16.px, 0, 16.px),
              child: Text(
                "隐私政策更新提示",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: color_FF303133,
                    fontSize: 16.px,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16.px),
              child: Text(
                "更新时间：2022年01月01日",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: color_FF909399,
                    fontSize: 12.px,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(28.px, 0, 28.px, 12.px),
              child: RichText(
                text: TextSpan(
                    text: "感谢您使用萌果视频！\n    ",
                    style: TextStyle(
                        height: 1.5, color: color_FF303133, fontSize: 14.px),
                    children: [
                      TextSpan(
                          text: "我们对",
                          style: TextStyle(
                              height: 1.6,
                              color: color_FF303133,
                              fontSize: 12.px)),
                      TextSpan(
                          text: "《用户注册协议》",
                          style: TextStyle(
                            height: 1.5,
                            color: color_FF1B65B9,
                            fontSize: 13.px,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, UserAgreementPage.sName);
                            }),
                      TextSpan(
                          text: "与",
                          style: TextStyle(
                              height: 1.6,
                              color: color_FF303133,
                              fontSize: 12.px)),
                      TextSpan(
                          text: "《隐私政策》",
                          style: TextStyle(
                            height: 1.5,
                            color: color_FF1B65B9,
                            fontSize: 13.px,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicyDetailPage.sName);
                            }),
                      TextSpan(
                          text:
                              "进行了更新，本次更新的内容主要包括：完善个人数据的收集说明，补充用户信息保护政策和内容发布规范等。为保护您的个人信息，特向您通知并申请明确授权。请您仔细阅读",
                          style: TextStyle(
                              height: 1.6,
                              color: color_FF303133,
                              fontSize: 12.px)),
                      TextSpan(
                          text: "《用户注册协议》",
                          style: TextStyle(
                            height: 1.5,
                            color: color_FF1B65B9,
                            fontSize: 13.px,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, UserAgreementPage.sName);
                            }),
                      TextSpan(
                          text: "与",
                          style: TextStyle(
                              height: 1.6,
                              color: color_FF303133,
                              fontSize: 12.px)),
                      TextSpan(
                          text: "《隐私政策》",
                          style: TextStyle(
                            height: 1.5,
                            color: color_FF1B65B9,
                            fontSize: 13.px,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicyDetailPage.sName);
                            }),
                      TextSpan(
                          text: "，若您点击“同意并继续”按钮，表示您已理解并同意更新后的",
                          style: TextStyle(
                              height: 1.6,
                              color: color_FF303133,
                              fontSize: 12.px)),
                      TextSpan(
                          text: "《用户注册协议》",
                          style: TextStyle(
                            height: 1.5,
                            color: color_FF1B65B9,
                            fontSize: 13.px,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, UserAgreementPage.sName);
                            }),
                      TextSpan(
                          text: "与",
                          style: TextStyle(
                              height: 1.6,
                              color: color_FF303133,
                              fontSize: 12.px)),
                      TextSpan(
                          text: "《隐私政策》",
                          style: TextStyle(
                            height: 1.5,
                            color: color_FF1B65B9,
                            fontSize: 13.px,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicyDetailPage.sName);
                            }),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 12.px, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      width: 72.px,
                      height: 28.px,
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
                          "退出应用",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: color_FF909399,
                            fontSize: 12.px,
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
                      width: 72.px,
                      height: 28.px,
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
                          "同意并继续",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: color_FF1B65B9,
                            fontSize: 12.px,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // HiCache.getInstance().setBool("isAgree", true);
                      SpUtils.putBool("isAgree", true);
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
