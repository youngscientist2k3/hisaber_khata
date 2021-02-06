import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/constants/credit_debit_constants.dart'
    as CreditDebitConstants;
import 'package:hisaber_khata/widgets/credit_debit_date_picker.dart';
import 'package:hisaber_khata/widgets/credit_debit_entry_row.dart';
import 'package:provider/provider.dart';

class CreditDebitEntryContainer extends StatelessWidget {
  final Color color;
  CreditDebitEntryContainer(this.color);

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
                      appBrain: appBrain,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.0),
              CreditDebitEntryRow(
                  color: color, text: 'DESCRIPTION', appBrain: appBrain),
              SizedBox(width: 20.0),
              CreditDebitEntryRow(
                  color: color, text: 'AMOUNT', appBrain: appBrain),
              SizedBox(height: 20.0),
              RaisedButton(
                color: color,
                onPressed: () {
                  if (appBrain.amount != null && appBrain.description != null) {
                    appBrain.addRow();
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
