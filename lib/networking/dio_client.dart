import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_response.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute * 5;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute * 5;

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other &&
      error is SocketException; // import 'dart:io' for SocketException
}

class DioClient {
  final String? baseUrl;
  Dio? _dio;

  DioClient({this.baseUrl, Dio? dio}) {
    _dio = dio ?? Dio();
    _dio?.options.baseUrl = baseUrl ?? "";
    _dio?.options.connectTimeout = _defaultConnectTimeout;
    _dio?.options.receiveTimeout = _defaultReceiveTimeout;
    _dio?.httpClientAdapter;
    if (kDebugMode) {
      _dio?.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: false,
          requestBody: true));
    }
    _dio?.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onError: (DioError e, handler) async {
      if (e.response != null) {
        if (e.response?.statusCode == 403) {
        } else {
          handler.next(e);
        }
      } else {
        handler.next(e);
      }
    }));
  }

  Future<ApiResponse> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio?.get(
        endPoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      print(jsonEncode(response?.data));
      return ApiResponse(
          status: Status.success,
          code: response?.statusCode,
          data: response?.data,
          header: response?.headers.toString(),
          message: response?.statusMessage);
    } on DioError catch (e) {
      String errorMsg = "";
      int statusCode = 0;
      if (e.isNoConnectionError) {
        errorMsg = "no internet connection";
      } else if (e.response?.data != null) {
        errorMsg = e.response?.data["error"];
        statusCode = e.response?.data["status"];
      } else {
        errorMsg = e.message;
        statusCode = 0;
      }
      return ApiResponse(message: errorMsg, code: statusCode);
    } catch (e) {
      String errorMsg = "";
      int statusCode = 0;
      return ApiResponse(message: errorMsg, code: statusCode);
    }
  }

  Future<ApiResponse> post(
    String endPoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio?.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResponse(
          status: Status.success,
          code: response?.statusCode,
          data: response?.data,
          message: response?.statusMessage);
    } on DioError catch (e) {
      String? errorMsg = "";
      int statusCode = 0;
      if (e.response?.data != null) {
        String str = jsonEncode(e.response?.data);
        errorMsg = e.response?.statusMessage;
        statusCode = e.response?.statusCode ?? 0;
        return ApiResponse(
            message: errorMsg, code: statusCode, data: e.response?.data);
      } else {
        errorMsg = e.message;
        statusCode = 0;
        return ApiResponse(message: errorMsg, code: statusCode);
      }
    } catch (e) {
      String errorMsg = "";
      int statusCode = 0;
      return ApiResponse(message: errorMsg, code: statusCode);
    }
  }
}
