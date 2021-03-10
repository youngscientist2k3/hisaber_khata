import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/screens/statement_screen.dart';
import 'package:hisaber_khata/storage/local_storage.dart';
import 'package:hisaber_khata/widgets/login_screen_alert_dialog.dart';
import 'package:provider/provider.dart';

class ExistingAccountComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String accountNumber;
    bool existsAccountNumber;
    return AlertDialog(
      title: Text('Enter a Existing Account Number'),
      titlePadding: EdgeInsets.all(20.0),
      titleTextStyle: TextStyle(fontSize: 15.0, color: Colors.black),
      content: TextFormField(
        decoration: InputDecoration(border: OutlineInputBorder()),
        autofocus: true,
        onChanged: (val) async {
          accountNumber = val;
          print(accountNumber);
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('BACK'),
            ),
            FlatButton(
              onPressed: () async {
                print('button is working');
                existsAccountNumber =
                    await LocalStorage.checkDatabaseExists(accountNumber);
                print(accountNumber);
                print(existsAccountNumber);
                if (existsAccountNumber == true) {
                  print('def is not null');
                  await LocalStorage.operateExistingDatabase(accountNumber);
                  print('database operated');
                  Navigator.pushNamed(context, StatementScreen.id);
                  await Provider.of<AppBrain>(context, listen: false)
                      .fetchDataBase();
                } else if (existsAccountNumber == false) {
                  print('db is false');
                  return wrongExistingEntryAlertDialog(context);
                }
              },
              child: Text('OK'),
            )
          ],
        )
      ],
    );
  }
}
