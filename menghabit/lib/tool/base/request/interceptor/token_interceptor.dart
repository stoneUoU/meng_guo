import 'dart:io';
import 'package:dio/dio.dart';
import 'package:menghabit/tool/constants/http_constants.dart';
import 'package:menghabit/menghabit.dart';
// import 'package:habit/habit.dart';
// import 'package:menghabit/tool/constants/http_constants.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (authorizationStr.isNotNullOrEmpty()) {
      Map<String, dynamic>? headers = options.headers;
      headers[HttpHeaders.authorizationHeader] = authorizationStr;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _checkAuthorizationInfo(response);
    handler.next(response);
  }

  ///
  /// Param [Response] 返回结果
  /// 判断服务端是否返回 authorization数据, 如果存在重新赋值
  ///
  void _checkAuthorizationInfo(Response response) {
    String? authorization = response.headers.value('authorization');
    if (authorization != null) {
      authorizationStr = authorization;
    }
  }
}
