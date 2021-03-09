import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/screens/statement_screen.dart';
import 'package:hisaber_khata/storage/local_storage.dart';
import 'package:hisaber_khata/utilities/database_utility.dart';
import 'package:hisaber_khata/widgets/loginscreen_alert_dialog.dart';
import 'package:provider/provider.dart';

class ExistingAccountComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      autofocus: true,
      onFieldSubmitted: (val) async {
        DatabaseUtility.databaseName = val;

        bool db = await LocalStorage.checkDatabaseExists(
            DatabaseUtility.databaseName);
        if (db == true) {
          print('def is not null');
          await LocalStorage.operateExistingDatabase(
              DatabaseUtility.databaseName);
          Navigator.pushNamed(context, StatementScreen.id);
          await Provider.of<AppBrain>(context, listen: false).fetchDataBase();
        } else if (db == false) {
          print('db is false');
          return wrongExistingEntryAlertDialog(context);
        }
      },
    );
  }
}
