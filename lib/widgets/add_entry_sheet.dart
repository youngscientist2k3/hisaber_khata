import 'package:flutter/material.dart';
import 'package:hisaber_khata/widgets/add_entry.dart';

addEntrySheet(BuildContext context, Color color) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddEntry(color),
          ));
}
