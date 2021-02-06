import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:provider/provider.dart';
import 'package:hisaber_khata/constants/common_constants.dart' as constCommon;

class AddEntry extends StatelessWidget {
  final Color color;

  AddEntry(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.0,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Consumer<AppBrain>(
          builder: (context, appBrain, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 10.0),
                  Container(
                    width: 100.0,
                    child: DateTimePicker(
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
                              '${dateTime.day} ${constCommon.months[dateTime.month.toString()]} ${dateTime.year}';
                        }),
                  ),
                ],
              ),
              SizedBox(width: 20.0),
              Row(
                children: [
                  Text(
                    'DESCRIPTION:',
                    style: TextStyle(color: color),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: color),
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: color.withOpacity(0.3)),
                      autofocus: true,
                      onChanged: (value) {
                        appBrain.description = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.0),
              Row(
                children: [
                  Text(
                    'AMOUNT:',
                    style: TextStyle(color: color),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: color.withOpacity(0.3)),
                      textCapitalization: TextCapitalization.characters,
                      style: TextStyle(color: color),
                      autofocus: true,
                      onChanged: (value) {
                        appBrain.amount = value;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: color,
                onPressed: () {
                  if (appBrain.amount != null && appBrain.description != null) {
                    appBrain.addRow();
                    Navigator.pop(context);
                  }
                },
                child: Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
