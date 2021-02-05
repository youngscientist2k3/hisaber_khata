import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:provider/provider.dart';

class UtilityModel{

  AppBar buildStatementAppBar(BuildContext context) {
    return AppBar(centerTitle: true, title: Text('My Hisaaber Khata'), actions: [
      RawMaterialButton(
        child: Icon(Icons.clear_sharp),
        onPressed: () {
          Provider.of<AppBrain>(context, listen: false).clear();
        },
      ),
    ]);
  }

}