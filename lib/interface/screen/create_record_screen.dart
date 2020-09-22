import 'package:flutter/material.dart';
import 'package:mementor/generated/l10n.dart';
import 'package:mementor/models/record_model.dart';
import 'package:mementor/resources/utility/record_helper.dart';

class CreateRecordScreen extends StatelessWidget {
  static const String route = "/createRecordScreen";

  RecordType recordType;
  RecordModel record = RecordModel();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    recordType = ModalRoute.of(context).settings.arguments as RecordType;
    record.recordType = recordType;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(title: Text(recordType != RecordType.DEBIT ? S.current.newDebit : S.current.newCredit)),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.numberWithOptions(signed: false),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2,
                              decoration: InputDecoration(hintText: "0,00", suffixText: "€"),
                              validator: (String value) =>
                                  double.tryParse(value.replaceAll(",", ".")) == null || double.tryParse(value.replaceAll(",", ".")) < 0 ? S.current.invalidData : null,
                              onSaved: (String value) => record.value = double.parse(value.replaceAll(",", ".")),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: (recordType == RecordType.DEBIT ? S.current.debtor : S.current.creditor) + ":",
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        validator: (String value) => value.isEmpty ? S.current.insertData : null,
                        onSaved: (String recipient) => record.recipient = recipient,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: S.current.causal + ":", labelStyle: TextStyle(color: Colors.black54), floatingLabelBehavior: FloatingLabelBehavior.always),
                          autocorrect: true,
                          minLines: 900,

                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          //expands: true,
                          maxLength: 140,
                          onSaved: (String causal) => record.causal = causal,
                        ),
                      ),
                      InputDatePickerFormField(
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        onDateSaved: (DateTime date) => record.date = date,
                      ),
                    ],
                  ),
                ),
              ),
              OutlineButton(
                child: Container(width: double.infinity, child: Center(child: Text(S.current.save))),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _formKey.currentState.save();
                  
                    await RecordHelper.addRecord(record);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
