import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/constants/common_constants.dart'
    as CommonConstants;
import 'package:hisaber_khata/constants/credit_debit_constants.dart'
    as CreditDebitConstants;
import 'package:hisaber_khata/utilities/storage_utility.dart';
import 'package:hisaber_khata/widgets/credit_debit_date_picker.dart';
import 'package:hisaber_khata/widgets/credit_debit_entry_row.dart';
import 'package:provider/provider.dart';

class CreditDebitEntryContainer extends StatelessWidget {
  final Color color;
  final selection;
  CreditDebitEntryContainer(this.color, this.selection);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.0,
      decoration: CreditDebitConstants.entryContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Consumer<AppBrain>(
          builder: (context, appBrain, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 10.0),
                  Container(
                    width: 100.0,
                    child: CreditDebitDatePicker(
                      appBrainDate: (val) {
                        DateTime dateTime = DateTime.parse(val);
                        appBrain.date =
                            '${dateTime.day} ${CommonConstants.months[dateTime.month.toString()]} ${dateTime.year}';
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.0),
              CreditDebitEntryRow(
                  color: color,
                  text: 'DESCRIPTION',
                  appBrainProperty: (value) {
                    appBrain.description = value;
                  }),
              SizedBox(width: 20.0),
              CreditDebitEntryRow(
                  color: color,
                  text: 'AMOUNT',
                  appBrainProperty: (value) {
                    appBrain.amount = double.parse(value);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: color,
                onPressed: () async {
                  if (appBrain.amount != null && appBrain.description != null) {
                    StorageUtility data = StorageUtility(
                      id: await appBrain.id,
                      date: appBrain.date,
                      description: appBrain.description,
                      amount: appBrain.amount,
                      selection: appBrain.selection,
                    );
                    print(data);
                    await appBrain.addTransactionTableRow(data);
                    Navigator.pop(context);
                  }
                },
                child: Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
