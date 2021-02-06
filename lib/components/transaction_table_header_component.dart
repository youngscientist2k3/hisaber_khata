import 'package:flutter/material.dart';
import 'package:hisaber_khata/constants/transaction_table_header_constants.dart'
    as DataTableHeaderConstants;

class TransactionTableHeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'DATE',
            style: DataTableHeaderConstants.textStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            'DESCRIPTION',
            style: DataTableHeaderConstants.textStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            'AMOUNT',
            style: DataTableHeaderConstants.textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
