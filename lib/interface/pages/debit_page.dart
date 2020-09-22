import 'package:flutter/material.dart';
import 'package:mementor/generated/l10n.dart';
import 'package:mementor/interface/widget/record_list_element.dart';
import 'package:mementor/models/record_model.dart';
import 'package:mementor/resources/provider/record_provider.dart';

class DebitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecordModel>>(
      future: RecordProvider.getAllRecords(),
      builder: (BuildContext context, AsyncSnapshot<List<RecordModel>> recordsSnapshot) {
        if (recordsSnapshot.hasData) {
          if (recordsSnapshot.data.isNotEmpty)
            return ListView.builder(
                itemCount: recordsSnapshot.data.length, itemBuilder: (BuildContext context, int index) => RecordListElement(recordsSnapshot.data.elementAt(index)));
          else
            return Center(child: Text(S.current.noRecords));
        }

        return Column(
          children: [
            Spacer(),
            LinearProgressIndicator(),
          ],
        );
      },
    );
  }
}
