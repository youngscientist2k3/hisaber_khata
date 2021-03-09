import 'package:flutter/material.dart';

wrongNewEntryAlertDialog(BuildContext context) {
  // set up the login screen.
  Widget cancelButton = FlatButton(
    child: Text("The database already exists"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

wrongExistingEntryAlertDialog(BuildContext context) {
  // set up the login screen.
  Widget cancelButton = FlatButton(
    child: Text("The database does not exist"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
