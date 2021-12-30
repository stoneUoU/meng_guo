import 'dart:core';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:menghabit/tool/base/request/interceptor/token_interceptor.dart';
import 'package:menghabit/tool/constant_config.dart';
import 'package:menghabit/tool/constants/constants.dart';
import 'package:menghabit/tool/constants/http_constants.dart';
import 'package:menghabit/tool/network/system_utils.dart';
// import 'package:menghabit/tool/utils/platform_utils.dart';

import 'http_error.dart';

class VvRequestClient {
  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
  static const int HTTP_SUCCEED = 10000;
  static const String contentType = 'application/json; charset=UTF-8';

  static final VvRequestClient _instance = VvRequestClient._internal();

  factory VvRequestClient() => _instance;
  Dio? _client;

  Dio? get dioService => _client;

  /// 创建 dio 实例对象
  VvRequestClient._internal() {
    if (_client == null) {
      var options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        headers: {
          // HttpHeaders.userAgentHeader: userAgent,
          HttpHeaders.contentTypeHeader: contentType,
          HttpHeaders.acceptLanguageHeader: SystemUtils.getAppLanguageAndReg(),
          HttpHeaders.authorizationHeader: authorizationStr ?? '',
          // 'os': PlatformUtils.operatingSystem,
          // 'version': appVersion,
          // 'X-Channel': appChannel,
          // 'X-Udid': appUuid,
        },
      );

      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      _client = Dio(options);
      if (!isRelease) {
        _client!.interceptors.add(
            LogInterceptor(requestBody: true, responseBody: true)); //开启请求日志
      }
      _client!.interceptors.add(TokenInterceptor());
      if (ConstantConfig.localProxy.isNotEmpty) {
        (_client!.httpClientAdapter as DefaultHttpClientAdapter)
            .onHttpClientCreate = (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
//          if(cert.pem==PEM){ // Verify the certificate
//            return true;
//          }
            return true;
          };
          client.findProxy = (uri) {
            return ConstantConfig.localProxy;
          };
        };
      }
    }
  }
}

///http请求成功回调
typedef void HttpSuccessCallback<T>(T result);

///失败回调
typedef void HttpFailureCallback(HttpError err);
