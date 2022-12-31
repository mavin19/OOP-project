import 'package:json_annotation/json_annotation.dart';

part 'register_model_req.g.dart';

@JsonSerializable(createFactory: false)
class RegisterModelReq {
  String name;
  String email;
  String password;

  RegisterModelReq(
      this.name,
      this.email,
      this.password,
      );

  Map<String, dynamic> toJson() => _$RegisterModelReqToJson(this);
}
