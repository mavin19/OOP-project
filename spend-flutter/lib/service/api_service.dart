import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spendflutter/model/login_model_req.dart';
import 'package:spendflutter/model/register_model_req.dart';
import 'package:spendflutter/model/spend_record_model.dart';
import 'package:spendflutter/model/spend_record_model_req.dart';
import 'package:spendflutter/model/user_model.dart';

part 'api_service.g.dart';

@injectable
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio, String baseUrl) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("/v1/auth/login")
  Future<UserModel> login(@Body() LoginModelReq body);

  @POST("/v1/auth/register")
  Future<UserModel> register(@Body() RegisterModelReq body);

  @POST("/v1/spend/{userId}")
  Future createSpend(
      @Path("userId") String id, @Body() SpendRecordModelReq body);

  @GET("/v1/spend/{userId}")
  Future<List<SpendRecordModel>> getAllSpend(@Path("userId") String id);

}
