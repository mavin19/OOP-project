import 'package:json_annotation/json_annotation.dart';

part 'login_model_req.g.dart';

@JsonSerializable(createFactory: false)
class LoginModelReq {
  String email;
  String password;

  LoginModelReq(
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() => _$LoginModelReqToJson(this);
}
