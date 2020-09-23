import 'package:mementor/models/record_model.dart';
import 'package:mementor/resources/provider/record_provider.dart';

class Repository {
  /// Tutte le API esposte da [RecordProvider].
  static Future<List<RecordModel>> getAllRecords() async => await RecordProvider.getAllRecords();

  static Future<List<RecordModel>> getAllDebits() async => await RecordProvider.getAllDebits();

  static Future<List<RecordModel>> getAllCredits() async => await RecordProvider.getAllCredits();
}
