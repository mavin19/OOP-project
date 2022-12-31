// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spend_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpendRecordModel _$SpendRecordModelFromJson(Map<String, dynamic> json) =>
    SpendRecordModel(
      json['id'] as String,
      json['item'] as String,
      json['cost'] as String,
      DateTime.parse(json['created_at'] as String),
    );
