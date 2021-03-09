import 'package:flutter/material.dart';
import 'package:hisaber_khata/components/existing_account_component.dart';
import 'package:hisaber_khata/components/new_account_component.dart';
import 'package:hisaber_khata/screens/statement_screen.dart';

class LoginScreen extends StatelessWidget {
  static const id = '/LoginPage';
  static bool db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RawMaterialButton(
              //New Database
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Enter a Unique Account Number'),
                    titlePadding: EdgeInsets.all(20.0),
                    titleTextStyle:
                        TextStyle(fontSize: 15.0, color: Colors.black),
                    content: NewAccountComponent(),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: 50.0,
                width: 200.0,
                color: Colors.cyan,
                child: Center(
                  child: Text('Create New Account'),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            RawMaterialButton(
              //Open Existing Database
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Enter a Existing Account Number'),
                    titlePadding: EdgeInsets.all(20.0),
                    titleTextStyle:
                        TextStyle(fontSize: 15.0, color: Colors.black),
                    content: ExistingAccountComponent(),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('BACK'),
                      ),
                      SizedBox(
                        width: 110.0,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, StatementScreen.id);
                        },
                        child: Text('OK'),
                      )
                    ],
                  ),
                );
              },
              child: Container(
                height: 50.0,
                width: 260.0,
                color: Colors.cyan,
                child: Center(child: Text('Enter Existing Account Number')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
