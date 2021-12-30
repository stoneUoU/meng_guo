// import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
// import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:menghabit/tool/base/paging/base_loading_dialog.dart';
import 'package:menghabit/tool/base/property/appdialog_extra_property.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/utils/common_utils.dart';
import 'package:menghabit/tool/utils/keyboard_utils.dart';
import 'package:menghabit/tool/widget/base/base_appbar_widget.dart';
import 'package:menghabit/tool/widget/base_view_model.dart';
import 'package:menghabit/tool/widget/dialog/common_dialog.dart';
import 'package:menghabit/tool/widget/empty_state_widget.dart';

typedef void PageStateCallBack<PageState>(PageState pageState);

///页面生命周期
enum PageState {
  RESUMED,
  INACTIVE,
  PAUSED,
  DETACHED,
}

/// Desc:全局基础布局

class BaseScaffold<VM extends BaseViewModel> extends StatefulWidget {
  /// 要渲染的布局
  final Widget body;

  /// 页面生命周期
  final PageStateCallBack<PageState>? pageState;

  /// ViewModel 相关信息
  final VM viewModel;

  /// 设置ToolBar
  final PreferredSizeWidget? toolBar;

  /// 自适应输入法弹出，重新计算view的高度，默认false
  final bool resizeToAvoidBottomInset;

  /// 使用默认添加的缺省页
  /// 如果需要自定义缺省页大小位置等，传false。通过createEmptyStateWidget创建一个可监控的缺省页Widget，自行控制显示的位置（无需控制隐藏显示）
  final bool useDefaultEmptyState;

  BaseScaffold({
    Key? key,
    this.pageState,
    required this.body,
    required this.viewModel,
    this.toolBar,
    this.resizeToAvoidBottomInset = false,
    this.useDefaultEmptyState = true,
  }) : super(key: key);

  @override
  _BaseScaffoldState<VM> createState() => _BaseScaffoldState<VM>();
}

class _BaseScaffoldState<VM extends BaseViewModel> extends State<BaseScaffold>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
    widget.viewModel.dialogProperty.addListener(_infoDialog);
    widget.viewModel.loadingDialog.addListener(_loadDialog);
    widget.viewModel.uploadLoadingDialog.addListener(_uploadLoadDialog);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    widget.viewModel.loadingDialog.removeListener(_loadDialog);
    widget.viewModel.dialogProperty.removeListener(_infoDialog);
    widget.viewModel.uploadLoadingDialog.removeListener(_uploadLoadDialog);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("--" + state.toString());
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        if (widget.pageState != null) {
          widget.pageState!(PageState.INACTIVE);
        }
        break;
      case AppLifecycleState.resumed: // 应用程序可见，前台
        if (widget.pageState != null) {
          widget.pageState!(PageState.RESUMED);
        }
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        if (widget.pageState != null) {
          widget.pageState!(PageState.PAUSED);
        }

        break;
      case AppLifecycleState.detached: // 申请将暂时暂停
        if (widget.pageState != null) {
          widget.pageState!(PageState.DETACHED);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.viewModel.globalBgColor.value,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: _findCurrentToolBar(),
      body: WillPopScope(
        onWillPop: () {
          if (widget.viewModel.appBarLeadingCallBack == null) {
            return Future.value(true);
          } else {
            return widget.viewModel.appBarLeadingCallBack!.call();
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            KeyboardUtils.hideByContext(context);
          },
          child: widget.useDefaultEmptyState
              ? ValueListenableBuilder<EmptyState>(
                  valueListenable: widget.viewModel.emptyState,
                  builder: (context, state, _) => state == EmptyState.NORMAL
                      ? widget.body
                      : createEmptyStateWidget<VM>(
                          context,
                          appBar: widget.toolBar,
                          listen: false,
                        ),
                )
              : widget.body,
        ),
      ),
    );
  }

  /// Desc:获取当前的Toolbar的参数
  /// Date: 4/12/21
  PreferredSizeWidget? _findCurrentToolBar() {
    /// 优先显示设置的toolBar
    if (widget.toolBar != null) {
      return widget.toolBar;
    }

    /// 显示默认的toolbar
    if (widget.toolBar == null && widget.viewModel.appBarIsShow) {
      return AppBarWidget(widget.viewModel);
    }
    return null;
  }

  /// Desc:加载弹窗
  /// Date: 4/12/21
  void _loadDialog() {
    LoadingDialog? loadingDialog = widget.viewModel.loadingDialog.value;
    if (loadingDialog == null) {
      return;
    }
    if (loadingDialog.showLoadingDialog) {
      CommonUtils.showLoadingDialog(context,
              barrierDismissible: loadingDialog.isCancelable)
          .then((value) {
        LoadingDialog? loadingDialog = widget.viewModel.loadingDialog.value;
        if (loadingDialog != null &&
            loadingDialog.showLoadingDialog &&
            loadingDialog.isCancelable) {
          Navigator.of(context).pop();
        }
        widget.viewModel.loadingDialog.value = null;
      });
    } else {
      CommonUtils.disMissLoadingDialog(context);
      widget.viewModel.loadingDialog.value = null;
    }
  }

  /// Desc:上传加载弹窗
  /// Date: 4/12/21
  void _uploadLoadDialog() {
    LoadingDialog? loadingDialog = widget.viewModel.uploadLoadingDialog.value;
    if (loadingDialog == null) {
      return;
    }
    if (loadingDialog.showLoadingDialog) {
      CommonUtils.showUploadLoadingDialog(context,
              barrierDismissible: loadingDialog.isCancelable)
          .then((value) {
        LoadingDialog? loadingDialog =
            widget.viewModel.uploadLoadingDialog.value;
        if (loadingDialog != null &&
            loadingDialog.showLoadingDialog &&
            loadingDialog.isCancelable) {
          Navigator.of(context).pop();
        }
        widget.viewModel.uploadLoadingDialog.value = null;
      });
    } else {
      CommonUtils.disMissLoadingDialog(context);
      widget.viewModel.uploadLoadingDialog.value = null;
    }
  }

  ///
  ///  弹出框信息
  ///
  void _infoDialog() {
    if (widget.viewModel.dialogProperty.value != null) {
      DialogProperty value = widget.viewModel.dialogProperty.value!;
      showDialog<Dialog>(
        context: context,
        barrierDismissible: value.dialogExtra.barrierDismissible,
        builder: (BuildContext context) {
          return CommonDialog.value(value);
        },
      );
    }
  }
}
