import 'package:mementor/models/record_model.dart';
import 'package:mementor/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class RecordBloc {
  PublishSubject<List<RecordModel>> _allRecordsFetcher = PublishSubject<List<RecordModel>>();
  PublishSubject<List<RecordModel>> _allDebitsFetcher = PublishSubject<List<RecordModel>>();
  PublishSubject<List<RecordModel>> _allCreditsFetcher = PublishSubject<List<RecordModel>>();

  Stream<List<RecordModel>> get allRecords => _allRecordsFetcher.stream;

  Stream<List<RecordModel>> get allDebits => _allDebitsFetcher.stream;

  Stream<List<RecordModel>> get allCredits => _allCreditsFetcher.stream;

  Future<List<RecordModel>> getAllRecords() async {
    List<RecordModel> allRecords = await Repository.getAllRecords();

    _allRecordsFetcher.sink.add(allRecords);
    _allDebitsFetcher.sink.add(allRecords.where((element) => element.recordType == RecordType.DEBIT).toList());
    _allCreditsFetcher.sink.add(allRecords.where((element) => element.recordType == RecordType.CREDIT).toList());
    return allRecords;
  }

  Future<List<RecordModel>> getAllDebits() async {
    List<RecordModel> allDebits = await Repository.getAllDebits();

    _allDebitsFetcher.sink.add(allDebits);
    return allDebits;
  }

  Future<List<RecordModel>> getAllCredits() async {
    List<RecordModel> allCredits = await Repository.getAllCredits();

    _allCreditsFetcher.sink.add(allCredits);
    return allCredits;
  }

  dispose() {
    _allRecordsFetcher.close();
    _allDebitsFetcher.close();
    _allCreditsFetcher.close();
  }
}

final RecordBloc recordBloc = RecordBloc();
