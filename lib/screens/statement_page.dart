import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:provider/provider.dart';
import 'package:hisaber_khata/widgets/credit_debit_buttons.dart';
import 'package:hisaber_khata/widgets/my_data_table.dart';
import 'package:hisaber_khata/widgets/net_balance_widget.dart';
import 'package:hisaber_khata/widgets/data_table_header.dart';

class StatementPage extends StatelessWidget {
  static const id = '/StatementPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: Text('My Hisaaber Khata'), actions: [
        RawMaterialButton(
          child: Icon(Icons.clear_sharp),
          onPressed: () {
            Provider.of<AppBrain>(context, listen: false).clear();
          },
        ),
      ]),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            NetBalance(),
            SizedBox(
              height: 20.0,
            ),
            DataTableHeader(),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: MyDataTable(),
            ),
            CreditDebitButtonContainer(),
          ],
        ),
      ),
    );
  }
}
