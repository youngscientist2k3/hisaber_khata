import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/models/utility_models.dart';
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
        CommonUtility().showCreditDebitSheet(context, color);
      },
      child: Text(selection),
    );
  }
}
