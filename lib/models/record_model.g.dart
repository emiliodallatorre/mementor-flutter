// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) {
  return RecordModel(
    id: json['id'] as String,
    recordType: _$enumDecodeNullable(_$RecordTypeEnumMap, json['recordType']),
    value: (json['value'] as num)?.toDouble(),
    recipient: json['recipient'] as String,
    causal: json['causal'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$RecordModelToJson(RecordModel instance) => <String, dynamic>{
      'id': instance.id,
      'recordType': _$RecordTypeEnumMap[instance.recordType],
      'value': instance.value,
      'recipient': instance.recipient,
      'causal': instance.causal,
      'date': instance.date?.toIso8601String(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries.singleWhere((e) => e.value == source, orElse: () => null)?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RecordTypeEnumMap = {
  RecordType.DEBIT: 'DEBIT',
  RecordType.CREDIT: 'CREDIT',
};
