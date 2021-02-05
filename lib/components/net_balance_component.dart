import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:provider/provider.dart';
import 'package:hisaber_khata/constants/const_netBalance.dart'
    as constNetBalance;

class NetBalanceComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: constNetBalance.shape,
      margin: constNetBalance.margins,
      elevation: 100.0,
      shadowColor: Colors.grey.withOpacity(0.1),
      child: Container(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Net Balance',
              style: constNetBalance.textStyle,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              Provider.of<AppBrain>(context, listen: true)
                  .fetchNetBalance()
                  .toString(),
              style: constNetBalance.textStyle,
            )
          ],
        ),
      ),
    );
  }
}
