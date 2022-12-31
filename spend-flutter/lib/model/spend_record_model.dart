import 'package:json_annotation/json_annotation.dart';

part 'spend_record_model.g.dart';

@JsonSerializable(createToJson: false)
class SpendRecordModel {
  String id;
  String item;
  String cost;
  DateTime created_at;

  SpendRecordModel(
    this.id,
    this.item,
    this.cost,
    this.created_at,
  );

  factory SpendRecordModel.fromJson(Map<String, dynamic> json) =>
      _$SpendRecordModelFromJson(json);
}
