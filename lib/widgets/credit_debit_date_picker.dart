import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:hisaber_khata/constants/common_constants.dart'
    as CommonConstants;

class CreditDebitDatePicker extends StatelessWidget {
  final AppBrain appBrain;
  CreditDebitDatePicker({@required this.appBrain});

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
        dateLabelText: 'DATE',
        type: DateTimePickerType.date,
        initialValue: DateTime.now().toString(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        validator: (val) {
          return null;
        },
        onChanged: (val) {
          DateTime dateTime = DateTime.parse(val);
          appBrain.date =
              '${dateTime.day} ${CommonConstants.months[dateTime.month.toString()]} ${dateTime.year}';
        });
  }
}
