import 'package:flutter/material.dart';
import 'package:hisaber_khata/components/credit_debit_button_component.dart';
import 'package:hisaber_khata/components/net_balance_component.dart';
import 'package:hisaber_khata/components/transaction_table_component.dart';
import 'package:hisaber_khata/utilities/common_utility.dart';

class StatementScreen extends StatelessWidget {
  static const id = '/StatementScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonUtility().buildStatementAppBar(context),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            NetBalanceComponent(),
            SizedBox(
              height: 20.0,
            ),
            TransactionTableHeaderComponent(),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: TransactionTableDetailComponent(),
            ),
            SizedBox(
              height: 10.0,
            ),
            CreditDebitComponent(),
          ],
        ),
      ),
    );
  }
}
