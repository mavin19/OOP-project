import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../model/create_report_req.dart';
import '../model/login_req.dart';
import '../model/project_list_req.dart';
import '../model/register_req.dart';
import '../model/user_model.dart';


part 'api_service.g.dart';

@injectable
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(
    Dio dio, {
    @Named('apiBaseUrl') String? baseUrl,
    @Named('apiAccessToken') String? accessToken,
    @factoryParam bool? isAnonymous,
  }) {
    isAnonymous ??= false;
    if (!isAnonymous) {
      dio.options.headers.addAll({
        'Authorization': 'Bearer $accessToken',
      });
    }

    return _ApiService(dio, baseUrl: baseUrl);
  }
  @POST("/public/api/v1/noauth/auth")
  Future<UserModel> login(@Body() LoginReq body);
  @POST("/public/api/v1/noauth/users")
  Future<UserModel> register(@Body() RegisterReq body);
  @GET("/public/api/v1/projects")
  Future<ProjectListReq> getProject();
  @POST("/public/api/v1/inspections")
  Future createReport(@Body() CreateReportReq body);
}
