import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/utilities/common_utility.dart';
import 'package:provider/provider.dart';

class CreditDebitButton extends StatelessWidget {
  final Color color;
  final String selection;

  CreditDebitButton({@required this.selection, @required this.color});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: () {
        Provider.of<AppBrain>(context, listen: false).clearCreditDebitField();
        Provider.of<AppBrain>(context, listen: false).selection = selection;
        CommonUtility()
            .showCreditDebitEntryContainer(context, color, selection);
      },
      child: Text(selection),
    );
  }
}
