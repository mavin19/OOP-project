import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@Injectable()
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio, String baseUrl) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  // @POST("/public/api/v1/noauth/auth")
  // Future<UserModel> login(@Body() LoginReq body);
  //
  // @POST("/public/api/v1/noauth/users")
  // Future<UserModel> register(@Body() RegisterReq body);
  //
  // @GET("/public/api/v1/projects")
  // Future<ProjectListReq> getProject();
  //
  // @POST("/public/api/v1/inspections")
  // Future createReport(@Body() CreateReportReq body);
}
