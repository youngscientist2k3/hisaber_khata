import 'package:flutter/material.dart';
import 'package:hisaber_khata/routes/routes.dart';
import 'package:hisaber_khata/screens/statement_page.dart';
import 'package:hisaber_khata/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:hisaber_khata/brain/app_brain.dart';

void main() {
  runApp(ChangeNotifierProvider<AppBrain>(
    create: (context) => AppBrain(),
    child: HisaaberKhata(),
  ));
}

class HisaaberKhata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appTheme,
      initialRoute: StatementPage.id,
      routes: routes,
    );
  }
}
