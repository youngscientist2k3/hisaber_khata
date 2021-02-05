import 'package:flutter/material.dart';
import 'package:hisaber_khata/routes/routes.dart';
import 'package:hisaber_khata/screens/statement_screen.dart';
import 'package:provider/provider.dart';
import 'package:hisaber_khata/brain/app_brain.dart';

void main() {
  runApp(ChangeNotifierProvider<AppBrain>(
    create: (context) => AppBrain(),
    child: HisaaberKhataApp(),
  ));
}

class HisaaberKhataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appTheme,
      initialRoute: StatementScreen.id,
      routes: routes,
    );
  }
}
