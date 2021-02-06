import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/constants/common_constants.dart'
    as CommonConstants;
import 'package:hisaber_khata/widgets/credit_debit_entry_container.dart';
import 'package:provider/provider.dart';

class CommonUtility {
  AppBar buildStatementAppBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text('My Hisaaber Khata'),
        actions: [
          RawMaterialButton(
            child: Icon(Icons.clear_sharp),
            onPressed: () {
              Provider.of<AppBrain>(context, listen: false).clear();
            },
          ),
        ]);
  }

  showCreditDebitEntryContainer(BuildContext context, Color color) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CreditDebitEntryContainer(color),
            ));
  }

  String dateTimeNow() =>
      '${DateTime.now().day} ${CommonConstants.months[DateTime.now().month.toString()]} ${DateTime.now().year}';
}
