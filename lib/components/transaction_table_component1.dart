import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/future_brain.dart';
import 'package:hisaber_khata/constants/transaction_table_constants.dart'
    as DataTableHeaderConstants;
import 'package:hisaber_khata/widgets/transaction_table_detail_row.dart';
import 'package:provider/provider.dart';

class TransactionTableDetailComponent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<FutureBrain>(
      initialData: FutureBrain(dataList: []),
      create: (context) => FutureBrain().fetchDatabase(context),
      child: FutureBrain().dataList == []
          ? CircularProgressIndicator()
          : Container(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, index) {
                  return TransactionTableDetailRow(
                      dataObjectList: FutureBrain().dataList, index: index);
                },
                itemCount: FutureBrain().dataList.length,
              ),
            ),
    );
  }
}

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
