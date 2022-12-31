import 'package:json_annotation/json_annotation.dart';

part 'spend_record_model_req.g.dart';

@JsonSerializable(createFactory: false)
class SpendRecordModelReq {
  String item;
  String cost;

  SpendRecordModelReq(
      this.item,
      this.cost,
      );

  Map<String, dynamic> toJson() => _$SpendRecordModelReqToJson(this);
}
