import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/constants/credit_debit_constants.dart'
    as CreditDebitConstants;

class CreditDebitEntryRow extends StatelessWidget {
  final String text;
  final Color color;
  final AppBrain appBrain;

  CreditDebitEntryRow({this.color, this.text, this.appBrain});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(color: color),
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: TextFormField(
            style: TextStyle(color: color),
            textCapitalization: TextCapitalization.characters,
            decoration: CreditDebitConstants.entryTextDecoration,
            autofocus: true,
            onChanged: (value) {
              appBrain.description = value;
            },
          ),
        ),
      ],
    );
  }
}
