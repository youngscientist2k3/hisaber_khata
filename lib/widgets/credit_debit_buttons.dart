import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/widgets/add_entry_sheet.dart';
import 'package:provider/provider.dart';

class CreditDebitButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CreditDebitButton(color: Colors.red, selectionText: 'CREDIT'),
          SizedBox(
            width: 15.0,
          ),
          CreditDebitButton(color: Colors.green, selectionText: 'DEBIT'),
        ],
      ),
    );
  }
}

class CreditDebitButton extends StatelessWidget {
  final Color color;
  final String selectionText;

  CreditDebitButton({@required this.selectionText, @required this.color});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: () {
        Provider.of<AppBrain>(context, listen: false).restartParameters();
        Provider.of<AppBrain>(context, listen: false).selection = selectionText;
        addEntrySheet(context, color);
      },
      child: Text(selectionText),
    );
  }
}
