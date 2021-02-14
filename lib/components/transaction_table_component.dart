import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/constants/transaction_table_constants.dart'
    as DataTableHeaderConstants;
import 'package:provider/provider.dart';

class TransactionTableComponent {
  List<Map<String, dynamic>> dataObjectList;
  bool showSpinner;

  fetchHeader(BuildContext context) {
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

  fetchDetail(BuildContext context) {
    Provider.of<AppBrain>(context, listen: false).fetchDataBase();
    dataObjectList = Provider.of<AppBrain>(context).dataList;
    if (dataObjectList != null) {
      return Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(dataObjectList[index]['date']),
                Text(dataObjectList[index]['description']),
                Text(dataObjectList[index]['amount'])
              ],
            );
          },
          itemCount: dataObjectList.length,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
