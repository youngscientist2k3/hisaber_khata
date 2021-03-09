import 'package:flutter/material.dart';

class TransactionTableDetailRow extends StatelessWidget {
  final List<Map<String, dynamic>> dataObjectList;
  final int index;
  TransactionTableDetailRow(
      {@required this.dataObjectList, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            dataObjectList[index]['date'],
            style: fetchTextStyle,
          ),
          Text(
            dataObjectList[index]['description'],
            style: fetchTextStyle,
          ),
          Text(
            dataObjectList[index]['amount'].toString(),
            style: fetchTextStyle,
          )
        ],
      ),
    );
  }

  TextStyle get fetchTextStyle => TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      color: dataObjectList[index]['selection'] == 'CREDIT'
          ? Colors.red
          : Colors.green);
}
