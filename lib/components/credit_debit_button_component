import 'package:flutter/material.dart';
import 'package:hisaber_khata/constants/credit_debit_constants.dart'
    as CreditDebitConstants;
import 'package:hisaber_khata/widgets/credit_debit_button.dart';

class CreditDebitComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CreditDebitButton(
              color: CreditDebitConstants.creditColor,
              selection: CreditDebitConstants.creditSelection),
          SizedBox(
            width: 15.0,
          ),
          CreditDebitButton(
              color: CreditDebitConstants.debitColor,
              selection: CreditDebitConstants.debitSelection),
        ],
      ),
    );
  }
}
