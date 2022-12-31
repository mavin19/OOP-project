import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkRegisterModule {
  String getContentApiBaseUrl() {
    return 'http://128.199.227.153:1345/';
  }

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
