import 'package:flutter/material.dart';
import 'package:hisaber_khata/models/UtilityModel.dart';
import 'package:hisaber_khata/components/credit_debit_button_component.dart';
import 'package:hisaber_khata/components/data_table_detail_component.dart';
import 'package:hisaber_khata/components/net_balance_component.dart';
import 'package:hisaber_khata/components/data_table_header_component.dart';

class StatementScreen extends StatelessWidget {
  static const id = '/StatementScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      UtilityModel().buildStatementAppBar(context),
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
            DataTableHeaderComponent(),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: DataTableDetailComponent(),
            ),
            CreditDebitButtonComponent(),
          ],
        ),
      ),
    );
  }
}

