import 'package:flutter/material.dart';
import 'package:hisaber_khata/constants/net_balance_constants.dart'
    as NetBalanceConstants;

class NetBalanceComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: NetBalanceConstants.shape,
      margin: NetBalanceConstants.margins,
      elevation: 100.0,
      color: NetBalanceConstants.containerColor,
      shadowColor: NetBalanceConstants.shadowColor,
      child: Container(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Net Balance',
              style: NetBalanceConstants.textStyle,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              '0',
              // Provider.of<AppBrain>(context, listen: true)
              //     .fetchNetBalanceAmount()
              //     .toString(),
              style: NetBalanceConstants.textStyle,
            )
          ],
        ),
      ),
    );
  }
}
