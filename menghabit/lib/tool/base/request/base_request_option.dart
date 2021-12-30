import 'dart:async';
// import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:menghabit/tool/constants/http_constants.dart';
// import 'package:menghabit/tool/constants/http_constants.dart';
// import 'package:menghabit/tool/constants/upload_img_type.dart';
// import 'package:menghabit/tool/network/aes/aes_util.dart';
// import 'package:menghabit/tool/network/entity/base_request_entity.dart';
import 'package:menghabit/tool/network/entity/base_response_entity.dart';
import 'package:menghabit/tool/network/net_exception.dart';
import 'package:menghabit/tool/network/system_utils.dart';
import 'package:menghabit/tool/network/vv_net_work.dart';
// import 'package:menghabit/tool/utils/log_utils.dart';

///具体实体类的请求操作
mixin BaseRequestOptionsMixin {
  static const String contentType = 'application/json; charset=UTF-8';
  static const String contentFormDataType = 'multipart/form-data';
  CancelToken _cancelToken = CancelToken();

  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
  static const int HTTP_SUCCEED = 10000;
  dynamic emptyData;

  Future<BaseResponseEntity<T>> request<T>(
    String requestUrl, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    bool isPost = true,
    Options? options,
    String? newBaseUrl,
  }) async {
    //设置默认值
    var dio = VvRequestClient().dioService;

    ///加密
    if (newBaseUrl != null && newBaseUrl.isNotEmpty) {
      dio!.options.baseUrl = newBaseUrl;
    }
    Response response = await dio!.request(requestUrl,
        data: data,
        queryParameters: queryParameters,
        cancelToken: _cancelToken,
        options: options ?? Options(method: (isPost ? 'POST' : 'GET')));
    if (response.statusCode == HttpStatus.ok) {
      var baseResult = response.data;
      // if (baseResult['code'] == HTTP_SUCCEED) {
      var data = baseResult['Data'];
      if (data != null) {
        try {
          if (baseResult['Code'] == 401) {
            throw (DioError(
                requestOptions: RequestOptions(path: requestUrl),
                error: baseResult['Message']));
          }
          if (baseResult['Code'] == 0) {
            BaseResponseEntity<T> baseResEntity = BaseResponseEntity(
              data: data,
              code: baseResult['Code'],
              message: baseResult['Message'],
              // timeStamp: baseResult['timeStamp'],
            );
            return Future.value(baseResEntity);
          }
          throw (DioError(
              requestOptions: RequestOptions(path: requestUrl),
              error: baseResult['Message']));
        } catch (e) {
          if (e is DioError) {
            throw (ResponseException(
                code: baseResult['Code'],
                message: e.error.toString(),
                errorData: baseResult['Data']));
          }
          throw (ResponseException(
              code: baseResult['Code'],
              message: e.toString(),
              errorData: baseResult['Data']));
        }
      } else {
        /// 错误抛出
        if (baseResult['Code'] != HttpStatus.ok) {
          throw (ResponseException(
            code: baseResult['Code'],
            message: baseResult['Message'],
            errorData: baseResult['Data'],
          ));
        } else {
          BaseResponseEntity<T> baseResEntity = BaseResponseEntity(
            data: Map<String, dynamic>(),
            code: baseResult['Code'],
            message: baseResult['Message'],
            // timeStamp: baseResult['timeStamp'],
          );
          return Future.value(baseResEntity);
        }
      }
      // } else {
      //   throw (new ResponseException(
      //       code: baseResult['code'],
      //       message: baseResult['message'],
      //       errorData: baseResult['data']));
      // }
    } else {
      throw (DioError(requestOptions: RequestOptions(path: requestUrl)));
    }
  }

  /// 不带参数上传图片
  Future<BaseResponseEntity<T>> sendForm<T>(
      String requestUrl, String filePath) async {
    int time = DateTime.now().millisecondsSinceEpoch;
    var dio = VvRequestClient().dioService;
    // Map<String, dynamic> data = Map();
    // data['modType'] = 'pos';
    // data['name'] = '$time.jpg';
    // data['picType'] = 'business';

    // FormData formData = FormData();
    // Map<String, String> stringMap = Map<String, String>.from(data);
    // formData.fields.addAll(stringMap.entries);
    //
    // formData.f
    // if (filePath.isNotEmpty) {
    //   formData.files.addAll([
    //     MapEntry(
    //       "file",
    //       MultipartFile.fromFileSync(filePath, filename: '$time.jpg'),
    //     ),
    //   ]);
    // }

    // File file = fileEntry.value;
    // String fileName = basename(file.path);
    // fileMap[fileEntry.key] =
    //     MultipartFile(file.openRead(), await file.length(), filename: fileName);

    // data.addAll(fileMap);
    // var formData = FormData.fromMap(data);
    FormData formData = FormData.fromMap({
      // "name": "file",
      // "fileName": '$time.png',
      "type": 1,
      "file": await MultipartFile.fromFile(filePath, filename: '$time.png'),
      // 支持文件数组上传
      // "files": [
      //   UploadFileInfo(File("./example/upload.txt"), "upload.txt"),
      //   UploadFileInfo(File("./example/upload.txt"), "upload.txt")
      // ]
    });

    Response response = await dio!.post(requestUrl, data: formData);
    if (response.statusCode == HttpStatus.ok) {
      var baseResult = response.data;
      // if (baseResult['code'] == HTTP_SUCCEED) {
      var data = baseResult['Data'];
      if (data != null) {
        BaseResponseEntity<T> baseResEntity = BaseResponseEntity(
          data: data,
          code: baseResult['Code'],
          message: baseResult['Message'],
          // timeStamp: baseResult['timeStamp'],
        );
        return new Future.value(baseResEntity);
      } else {
        /// 错误抛出
        if (baseResult['Code'] != HttpStatus.ok) {
          throw (new ResponseException(
            code: baseResult['Code'],
            message: baseResult['Message'],
            errorData: baseResult['Data'],
          ));
        } else {
          BaseResponseEntity<T> baseResEntity = BaseResponseEntity(
            data: Map<String, dynamic>(),
            code: baseResult['Code'],
            message: baseResult['Message'],
            // timeStamp: baseResult['timeStamp'],
          );
          return new Future.value(baseResEntity);
        }
      }
    } else {
      throw (new DioError(requestOptions: RequestOptions(path: requestUrl)));
    }
  }

  /// 带参数的上传图片// 图片类型 business：营业执照 front：身份证头像 back：身份证国徽
  // Future<BaseResponseEntity<T>> sendForm2<T>(
  //     String requestUrl, String filePath, String picType) async {
  //   int time = DateTime.now().millisecondsSinceEpoch;
  //   var dio = VvRequestClient().dioService;
  //   Map<String, dynamic> data = Map();
  //   // data['modType'] = 'pos';
  //   data['modType'] = 'pos';
  //   data['name'] = '$time.jpg';
  //   data['picType'] = picType;
  //   // data['picType'] = 'business';
  //
  //   FormData formData = FormData();
  //   Map<String, String> stringMap = Map<String, String>.from(data);
  //   formData.fields.addAll(stringMap.entries);
  //
  //   if (filePath.isNotEmpty) {
  //     formData.files.addAll([
  //       MapEntry(
  //         "fileUpload",
  //         MultipartFile.fromFileSync(filePath, filename: '$time.jpg'),
  //       ),
  //     ]);
  //   }
  //
  //   // File file = fileEntry.value;
  //   // String fileName = basename(file.path);
  //   // fileMap[fileEntry.key] =
  //   //     MultipartFile(file.openRead(), await file.length(), filename: fileName);
  //
  //   // data.addAll(fileMap);
  //   // var formData = FormData.fromMap(data);
  //   Response response = await dio!.post(requestUrl, data: formData);
  //   if (response.statusCode == HttpStatus.ok) {
  //     var baseResult = response.data;
  //     // if (baseResult['code'] == HTTP_SUCCEED) {
  //     var data = baseResult['data'];
  //     if (data != null) {
  //       BaseResponseEntity<T> baseResEntity = BaseResponseEntity(
  //         data: data,
  //         code: baseResult['code'],
  //         message: baseResult['message'],
  //         // timeStamp: baseResult['timeStamp'],
  //       );
  //       return new Future.value(baseResEntity);
  //     } else {
  //       /// 错误抛出
  //       if (baseResult['code'] != HttpStatus.ok) {
  //         throw (new ResponseException(
  //           code: baseResult['code'],
  //           message: baseResult['message'],
  //           errorData: baseResult['data'],
  //         ));
  //       } else {
  //         BaseResponseEntity<T> baseResEntity = BaseResponseEntity(
  //           data: Map<String, dynamic>(),
  //           code: baseResult['code'],
  //           message: baseResult['message'],
  //           // timeStamp: baseResult['timeStamp'],
  //         );
  //         return new Future.value(baseResEntity);
  //       }
  //     }
  //   } else {
  //     throw (new DioError(requestOptions: RequestOptions(path: requestUrl)));
  //   }
  // }

  ///取消网络请求
  void cancelRequest() {
    if (!this._cancelToken.isCancelled) {
      this._cancelToken.cancel();
    }
  }
}
