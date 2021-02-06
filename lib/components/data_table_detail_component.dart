import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTableDetailComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              children: [Text('Date'), Text('Description'), Text('Amount')],
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
