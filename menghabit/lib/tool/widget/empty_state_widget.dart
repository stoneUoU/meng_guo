import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menghabit/menghabit.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/constants/colors.dart';
import 'package:menghabit/tool/constants/constants.dart';
// import 'package:habit/pigeon/router_finish_factory_pigeon.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'app_match_btn.dart';
import 'base/base_appbar_widget.dart';
import 'base_view_model.dart';

/// 创建一个缺省Widget
/// @params appBar 显示缺省页时，显示的标题栏，一般不需要
/// @params listen 是否需要监听缺省状态，只有BaseScaffold不需要监听
Widget createEmptyStateWidget<VM extends BaseViewModel>(BuildContext context,
    {PreferredSizeWidget? appBar, bool listen = true}) {
  if (listen) {
    var baseViewModel = Provider.of<VM>(context, listen: false);
    return ValueListenableBuilder<EmptyState>(
      valueListenable: baseViewModel.emptyState,
      builder: (context, state, _) => _BaseEmptyStateWidget<VM>(appBar: appBar),
    );
  }
  return _BaseEmptyStateWidget<VM>(appBar: appBar);
}

/// 缺省页
class _BaseEmptyStateWidget<VM extends BaseViewModel> extends StatelessWidget {
  /// 设置ToolBar
  final PreferredSizeWidget? appBar;

  _BaseEmptyStateWidget({this.appBar});

  @override
  Widget build(BuildContext context) {
    var baseViewModel = Provider.of<VM>(context, listen: false);
    if (baseViewModel.mState == EmptyState.PROGRESS) {
      return Container(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color99000000,
                  ),
                  child: SizedBox(
                      width: 110.px,
                      height: 110.px,
                      child: Lottie.asset(
                        baseViewModel.loadingAsset ??
                            "assets/json/lottie_loading.json",
                        fit: BoxFit.contain,
                        package: baseViewModel.resPackage,
                      )),
                )
              ], //.where((element) => element != null).toList(),
            ),
          ),
        ),
      );
    } else if (baseViewModel.mState == EmptyState.EMPTY ||
        baseViewModel.mState == EmptyState.NET_ERROR) {
      return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: _getCurrentAppBar(baseViewModel, context),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: (baseViewModel.marginTop.value).px,
                  ),
                  child: Image(
                    image: AssetImage(baseViewModel.emptyIconRes,
                        package: baseViewModel.resPackage),
                    width: 160.px,
                    height: 160.px,
                  ),
                ),
                Visibility(
                  visible: baseViewModel.currentStateLabel != null,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10.px,
                    ),
                    child: Text(
                      baseViewModel.currentStateLabel,
                      style: TextStyle(
                        color: color333333,
                        fontSize: 18.px,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: baseViewModel.currentNotifyStateLabel != null,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10.px,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18.px),
                    child: Text(
                      baseViewModel.currentNotifyStateLabel ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: color999999,
                        fontSize: 14.px,
                      ),
                    ),
                  ),
                ),

                /// 重试按钮
                Visibility(
                  visible: baseViewModel.showReload,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 6.px,
                      horizontal: 26.px,
                    ),
                    margin: EdgeInsets.only(top: 30.px),
                    child: buildMatchParentButton(
                      btnTitle: baseViewModel.reloadStr,
                      btnHeight: 34.px,
                      btnRadius: 17.px,
                      btnTitleSp: 14.px,
                      onPressed: () => baseViewModel.onReloadData(),
                      color: color_FF4CD080,
                    ),
                  ),
                )
              ],
            ),
          ));
    } else {
      return SizedBox();
    }
  }

  /// 提供状态栏的appbar
  PreferredSizeWidget _providerEmptyToolBar(
      VM baseViewModel, BuildContext context) {
    baseViewModel.setAppBarBgColor(Colors.white);
    baseViewModel.setAppBarBackIconColor(Colors.black);
    baseViewModel.setAppBarBrightness(SystemUiOverlayStyle.dark);
    if (baseViewModel.appBarLeadingCallBack == null) {
      baseViewModel.setAppBarLeadingCallBack(() {
        if (isRelease) {
          if (!Navigator.canPop(context)) {
            // RouterFinishManager().notifyFinishCurrentPage();
          } else {
            Navigator.pop(context);
          }
        } else {
          Navigator.pop(context);
        }
        return Future.value(true);
      });
    }
    return AppBarWidget(baseViewModel);
  }

  /// 获取状态栏的Toolbar
  PreferredSizeWidget? _getCurrentAppBar(
      VM baseViewModel, BuildContext context) {
    if (baseViewModel.hideStateToolBar) return null;
    if (appBar != null) return appBar;
    return _providerEmptyToolBar(baseViewModel, context);
  }
}
