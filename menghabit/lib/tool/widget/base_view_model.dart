import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:menghabit/tool/base/paging/base_loading_dialog.dart';
import 'package:menghabit/tool/base/property/appbar_extra_property.dart';
import 'package:menghabit/tool/base/property/appdialog_extra_property.dart';
import 'package:menghabit/tool/base/property/empty_state_model.dart';
import 'package:menghabit/tool/network/http_error.dart';
import 'package:menghabit/tool/network/login_interface.dart';
import 'package:menghabit/tool/network/vv_net_work.dart';

import 'base_model.dart';

///缺省页页面布局类型
enum LoadingType {
  /// 显示
  SHOW,

  /// 隐藏
  HIDE,
}

class BaseViewModel<T extends BaseModel> extends ChangeNotifier
    with EmptyModel, AppBarExtraProperty, AppDialogExtraProperty {
  /// 设置页面的全局背景色
  final ValueNotifier<Color> globalBgColor = ValueNotifier(Colors.white);

  ///显示隐藏LoadingDialog，区分mState.setEmpty
  ValueNotifier<LoadingDialog?> _loadingDialog = ValueNotifier(null);

  /// 上传loading
  ValueNotifier<LoadingDialog?> _uploadLoadingDialog = ValueNotifier(null);

  final T model;

  bool _disposed = false;

  bool get disposed => _disposed;

  bool _focusUpdate = false;

  bool get focusUpdate => _focusUpdate;

  set focusUpdate(bool value) {
    _focusUpdate = value;
    notifyListeners();
  }

  BaseViewModel(this.model) {
    pageType = PageType.NORMAL;
  }

  @override
  void dispose() {
    _disposed = true;
    if (model is BaseModel) {
      model.onClear();
    }
    super.dispose();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  void launch(Future<void> Function() future, HttpFailureCallback err,
      {bool ignoreToast = false,
      bool showLoadingIndicator = false,
      bool isCancelable = true}) {
    future().catchError((onError) {
      ///错误所有的网络异常
      print("啥错误${onError.toString()}");
      if (onError is DioError && onError.response?.statusCode == 401) {
        LoginInterface.login?.call();
      }
      err.call(HttpError.checkNetError(onError, ignoreToast: ignoreToast));
    });
  }

  @override
  void executeChangeNotify() {
    notifyListeners();
  }

  void focusUpdateWidget() {
    focusUpdate = true;
    _focusUpdate = false;
  }

  ValueNotifier<LoadingDialog?> get loadingDialog => _loadingDialog;

  ValueNotifier<LoadingDialog?> get uploadLoadingDialog => _uploadLoadingDialog;

  ///显示加载loading
  void showLoadingDialog({bool enableCancel = false}) {
    if (_loadingDialog.value == null ||
        !_loadingDialog.value!.showLoadingDialog) {
      _loadingDialog.value =
          LoadingDialog(showLoadingDialog: true, isCancelable: enableCancel);
    }
  }

  void showUploadLoadingDialog({bool enableCancel = false}) {
    if (_uploadLoadingDialog.value == null ||
        !_uploadLoadingDialog.value!.showLoadingDialog) {
      _uploadLoadingDialog.value =
          LoadingDialog(showLoadingDialog: true, isCancelable: enableCancel);
    }
  }

  ///隐藏加载loading
  void dismissLoadingDialog() {
    if (_loadingDialog.value != null &&
        _loadingDialog.value!.showLoadingDialog) {
      _loadingDialog.value = LoadingDialog(showLoadingDialog: false);
    }
  }

  void dismissUploadLoadingDialog() {
    if (_uploadLoadingDialog.value != null &&
        _uploadLoadingDialog.value!.showLoadingDialog) {
      _uploadLoadingDialog.value = LoadingDialog(showLoadingDialog: false);
    }
  }
}
