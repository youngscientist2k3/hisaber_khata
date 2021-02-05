import 'package:flutter/material.dart';
import 'package:hisaber_khata/constants/const_data_table_header.dart'
    as constDataTableHeader;

class DataTableHeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'DATE',
            style: constDataTableHeader.textStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            'DESCRIPTION',
            style: constDataTableHeader.textStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            'AMOUNT',
            style: constDataTableHeader.textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
