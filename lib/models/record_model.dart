import 'package:json_annotation/json_annotation.dart';

part 'record_model.g.dart';

@JsonSerializable()
class RecordModel {
  String id;

  RecordType recordType;
  double value;
  String recipient, causal;
  DateTime date;

  RecordModel({
    this.id,
    this.recordType,
    this.value,
    this.recipient,
    this.causal,
    this.date,
  });

  @override
  toString() => "Record $id.";

  factory RecordModel.fromJson(Map<String, dynamic> parsedJson) => _$RecordModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$RecordModelToJson(this);
}

enum RecordType { DEBIT, CREDIT }
