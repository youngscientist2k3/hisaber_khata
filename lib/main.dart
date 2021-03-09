import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/routes/routes.dart';
import 'package:hisaber_khata/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AppBrain>(
    create: (context) => AppBrain(),
    child: CalculaxApp(),
  ));
}

class CalculaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appTheme,
      initialRoute: LoginScreen.id,
      routes: routes,
    );
  }
}
