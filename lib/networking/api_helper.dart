import 'package:dio/dio.dart';

import '../constants/app_constants.dart';

class ApiHelper {
  static Dio createDio(
      {bool isCustomUrl = false, Map<String, String>? header}) {
    Dio dio = Dio(BaseOptions(
        baseUrl: isCustomUrl ? "" : "",
        responseType: ResponseType.json,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
        headers: header));
    return dio;
  }
}
