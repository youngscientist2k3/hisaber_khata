import 'package:flutter/material.dart';

const kColumnHeaderStyle = TextStyle(
    fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.deepOrange);

final kContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    boxShadow: [BoxShadow(color: Colors.grey.shade500)]);

final kInsideContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    border: Border.all(width: 2.0));

const Map<String, String> months = {
  '1': 'Jan',
  '2': 'Feb',
  '3': 'Mar',
  '4': 'Apr',
  '5': 'May',
  '6': 'Jun',
  '7': 'Jul',
  '8': 'Aug',
  '9': 'Sept',
  '10': 'Oct',
  '11': 'Nov',
  '12': 'Dec'
};
