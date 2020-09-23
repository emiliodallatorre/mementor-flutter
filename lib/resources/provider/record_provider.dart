import 'package:mementor/models/record_model.dart';
import 'package:mementor/references.dart';
import 'package:simple_database/simple_database.dart';

class RecordProvider {
  static SimpleDatabase _database = SimpleDatabase(name: References.recordDatabaseName, fromJson: (Map<String, dynamic> parsedJson) => RecordModel.fromJson(parsedJson));

  /// Fornisce la lista di tutti i record salvati nel database locale.
  static Future<List<RecordModel>> getAllRecords() async {
    List<RecordModel> allRecords = List<RecordModel>();

    allRecords.addAll((await _database.getAll()).cast());
    allRecords.sort((a, b) => b.date.compareTo(a.date));

    return allRecords;
  }

  /// Fornisce la lista di tutti i debiti nel database locale.
  static Future<List<RecordModel>> getAllDebits() async => (await getAllRecords()).where((element) => element.recordType == RecordType.DEBIT).toList();

  /// Fornisce la lista di tutti i crediti nel database locale.
  static Future<List<RecordModel>> getAllCredits() async => (await getAllRecords()).where((element) => element.recordType == RecordType.CREDIT).toList();

  /// Fornisce il record salvato - se esiste - con l'id [recordId].
  static Future<RecordModel> getRecordWithId(String recordId) async {
    List<RecordModel> allRecords = (await _database.getAll()).cast();

    return allRecords.where((element) => element.id == recordId).single;
  }
}
