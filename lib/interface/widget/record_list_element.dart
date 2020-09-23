import 'package:flutter/material.dart';
import 'package:mementor/interface/screen/create_record_screen.dart';
import 'package:mementor/models/record_model.dart';

class RecordListElement extends StatelessWidget {
  RecordModel record;

  RecordListElement(this.record);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(record.recipient),
      subtitle: Text(record.causal, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(
        (record.recordType == RecordType.CREDIT ? "+" : "-") + record.value.toStringAsFixed(2),
        style: TextStyle(
          fontSize: 16.0,
          color: record.recordType == RecordType.CREDIT ? Colors.green : Colors.red,
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(CreateRecordScreen.route, arguments: record),
    );
  }
}
