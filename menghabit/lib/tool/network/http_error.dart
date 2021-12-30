import 'dart:io';

import 'package:dio/dio.dart';
import 'package:menghabit/tool/base/build_config.dart';
import 'package:menghabit/tool/base/property/empty_constant.dart';
import 'package:menghabit/tool/network/net_exception.dart';
import 'package:oktoast/oktoast.dart';

import 'package:menghabit/menghabit.dart';

/// @desc  网络请求错误
/// @time 2020/11/12
class HttpError {
  ///HTTP 状态码
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  ///未知错误
  static const String UNKNOWN = "UNKNOWN";

  ///解析错误
  static const String PARSE_ERROR = "PARSE_ERROR";

  ///网络错误
  static const String NETWORK_ERROR = "NETWORK_ERROR";

  ///协议错误
  static const String HTTP_ERROR = "HTTP_ERROR";

  ///证书错误
  static const String SSL_ERROR = "SSL_ERROR";

  ///连接超时
  static const String CONNECT_TIMEOUT = "CONNECT_TIMEOUT";

  ///响应超时
  static const String RECEIVE_TIMEOUT = "RECEIVE_TIMEOUT";

  ///发送超时
  static const String SEND_TIMEOUT = "SEND_TIMEOUT";

  ///网络请求取消
  static const String CANCEL = "CANCEL";

  ///定义调用原生aop代码
  static const String ANDROID_AOP = "habit";
  static const String ANDROID_AOP_LOGIN_METHOD = "go2Login";

  String code = '';

  String message = '';

  HttpError(this.code, this.message);

  HttpError.checkNetError(dynamic error, {bool ignoreToast = false}) {
    //声明一个调用对象，需要把kotlin中注册的ChannelName传入构造函数
    if (error is DioError) {
      message = error.message;
      switch (error.type) {
        case DioErrorType.connectTimeout:
          code = CONNECT_TIMEOUT;
          message = netException;
          break;
        case DioErrorType.receiveTimeout:
          code = RECEIVE_TIMEOUT;
          message = netException;
          break;
        case DioErrorType.sendTimeout:
          code = SEND_TIMEOUT;
          message = netException;
          break;
        case DioErrorType.response:
          var statusCode = error.response?.statusCode;
          if (statusCode == HttpStatus.unauthorized) {
            // go2Login();
          }
          // code = HTTP_ERROR + statusCode.toString();
          code = statusCode.toString();
          message = netException;
          break;
        case DioErrorType.cancel:
          code = CANCEL;
          break;
        case DioErrorType.other:
          code = UNKNOWN;
          message = netException;
          break;
      }
    } else if (error is ResponseException) {
      code = error.code.toString();
      message = error.message;
    } else {
      code = UNKNOWN;
      message = error.toString();
    }
    if (!ignoreToast && message.isNotEmpty) {
      showToast(message, radius: 4.0);
    }
  }

  @override
  String toString() {
    return 'HttpError{code: $code, message: $message}';
  }

  // void go2Login() async {
  //   print("跳转登录页面");
  //   if (BuildConfig.isAndroid) {
  //     var go2login = await Habit.go2Login; //调用相应方法，并传入相关参数。
  //   } else {
  //     FlutterLoginAuthority().notifyAuthorityAction(
  //       AuthorityAction()..action = "401",
  //     );
  //   }
  // }
}
