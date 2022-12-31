// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spend_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpendRecordModel _$SpendRecordModelFromJson(Map<String, dynamic> json) =>
    SpendRecordModel(
      json['id'] as int,
      json['item'] as String,
      (json['cost'] as num).toDouble(),
      DateTime.parse(json['createdAt'] as String),
    );
