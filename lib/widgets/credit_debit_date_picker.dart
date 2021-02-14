import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CreditDebitDatePicker extends StatelessWidget {
  final Function appBrainDate;
  CreditDebitDatePicker({@required this.appBrainDate});

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
        onChanged: appBrainDate);
  }
}
