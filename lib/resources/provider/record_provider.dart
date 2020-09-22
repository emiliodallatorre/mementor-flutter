import 'package:mementor/models/record_model.dart';
import 'package:mementor/references.dart';
import 'package:simple_database/simple_database.dart';

class RecordProvider {
  static SimpleDatabase _database = SimpleDatabase(name: References.recordDatabaseName, fromJson: (Map<String, dynamic> parsedJson) => RecordModel.fromJson(parsedJson));

  /// Fornisce la lista di tutti i record salvati nel database locale.
  static Future<List<RecordModel>> getAllRecords() async {
    List<RecordModel> allRecords = await _database.getAll();

    return allRecords;
  }

  /// Fornisce il record salvato - se esiste - con l'id [recordId].
  static Future<RecordModel> getRecordWithId(String recordId) async {
    List<RecordModel> allRecords = await _database.getAll();

    return allRecords.where((element) => element.id == recordId).single;
  }
}
