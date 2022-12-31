import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendflutter/Service/api_service.dart';
import 'package:spendflutter/Service/share_pref_service.dart';

@module
abstract class NetworkRegisterModule {
  String getContentApiBaseUrl() {
    return 'http://192.168.0.119:8080';
  }

  // ApiService getApiService (Dio dio, String baseUrl) {
  //   return ApiService(dio, baseUrl);
  // }
  //
  // SharePrefService getSharePrefService(SharedPreferences pref) {
  //   return SharePrefService(pref);
  // }

  Dio getDio(
      BaseOptions options,
      PrettyDioLogger loggerInterceptor,
      ) {
    final dio = Dio();
    dio.options = options;
    dio.options.headers["accept"] = "application/json";
    dio.options.headers["content-type"] = "application/json";
    dio.interceptors.add(loggerInterceptor);
    return dio;
  }

  PrettyDioLogger getLoggerInterceptor() => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 150,
  );

  BaseOptions getBaseOption() => BaseOptions(
    sendTimeout: 30000,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}
