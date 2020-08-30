class RecordModel {
  RecordType recordType;
  double value;
  String recipient, causal;
  DateTime date;
}

enum RecordType { DEBIT, CREDIT }
