import 'package:json_annotation/json_annotation.dart';

part 'spend_record_model.g.dart';

@JsonSerializable(createToJson: false)
class SpendRecordModel {
  int id;
  String item;
  double cost;
  DateTime createdAt;

  SpendRecordModel(
    this.id,
    this.item,
    this.cost,
    this.createdAt,
  );

  factory SpendRecordModel.fromJson(Map<String, dynamic> json) =>
      _$SpendRecordModelFromJson(json);
}
