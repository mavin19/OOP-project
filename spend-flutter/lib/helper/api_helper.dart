

import 'package:spendflutter/di/configure.dart';
import 'package:spendflutter/service/api_service.dart';

class ApiHelper {
  static ApiService getApiService() {
    return ApiService(getIt.get(), getIt.get());
  }
}