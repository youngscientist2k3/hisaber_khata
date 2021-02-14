import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/constants/common_constants.dart'
    as CommonConstants;
import 'package:hisaber_khata/widgets/credit_debit_entry_container.dart';
import 'package:provider/provider.dart';

class CommonUtility {
  AppBar buildStatementAppBar(BuildContext context) {
    return AppBar(centerTitle: true, title: Text('Calculax'), actions: [
      RawMaterialButton(
        child: Icon(Icons.clear_sharp),
        onPressed: () {
          Provider.of<AppBrain>(context, listen: false).clearNetBalanceAmount();
        },
      ),
    ]);
  }

  showCreditDebitEntryContainer(
      BuildContext context, Color color, String selection) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CreditDebitEntryContainer(color, selection),
            ));
  }

  String dateTimeNow() =>
      '${DateTime.now().day} ${CommonConstants.months[DateTime.now().month.toString()]} ${DateTime.now().year}';
}
