import 'package:flutter/material.dart';
import 'package:mementor/models/record_model.dart';
import 'package:mementor/references.dart';
import 'package:mementor/resources/provider/record_provider.dart';
import 'package:simple_database/simple_database.dart';

class RecordHelper {
  static SimpleDatabase _database = SimpleDatabase(name: References.recordDatabaseName, fromJson: (Map<String, dynamic> parsedJson) => RecordModel.fromJson(parsedJson));

  /// Salva un record aggiungendolo semplicemente al database, dopo aver eseguito un check di unicità.
  static Future<void> addRecord(RecordModel record) async {
    List<RecordModel> allRecords = await RecordProvider.getAllRecords();

    if (allRecords.where((element) => element.id == record.id).isNotEmpty){
      editRecord(record, allRecords);
    }
    else {
      _database.add(record);
      debugPrint("Record salvato con successo.");
    }
  }
  
  static Future<void> editRecord(RecordModel record, List<RecordModel> recordList) async {
    _database.insert(record, recordList.indexWhere((element) => element.id == record.id));
    
    debugPrint("Modificato il record ${record.id}.");
  }

  /// Rimuove un record con l'id [recordId] e restituisce un errore se questo non esiste.
  static Future<void> removeRecord(String recordId) async {
    List<RecordModel> allRecords = await RecordProvider.getAllRecords();

    if (allRecords.where((element) => element.id == recordId).isEmpty)
      throw "Il record con id $recordId non esiste!";
    else {
      await _database.removeAt(allRecords.indexWhere((element) => element.id == recordId));
      debugPrint("Rimosso il record $recordId.");
    }
  }

  /// Rimuove tutti i record.
  static Future<void> removeAllRecords() async {
    _database.clear();

    debugPrint("Resettati tutti i record.");
  }
}
