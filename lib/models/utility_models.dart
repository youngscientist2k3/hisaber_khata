import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/widgets/add_entry.dart';
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

  showCreditDebitSheet(BuildContext context, Color color) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddEntry(color),
            ));
  }
}
