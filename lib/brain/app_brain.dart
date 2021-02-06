import 'package:flutter/material.dart';
import 'package:hisaber_khata/utilities/datetime_now.dart';

class AppBrain extends ChangeNotifier {
  String date = dateTimeNow();
  String description;
  String amount;
  int netBalance = 0;
  String selection;

  List<String> dateCells = [];
  List<String> descriptionCells = [];
  List<String> amountCells = [];
  List<String> selectionCells = [];

  addRow() {
    dateCells.insert(0, date);
    descriptionCells.insert(0, description);
    amountCells.insert(0, amount);
    selectionCells.insert(0, selection);
    notifyListeners();
  }

  clearCreditDebitField() {
    date = dateTimeNow();
    amount = null;
    description = null;
  }

  fetchNetBalanceAmount() {
    if (selection == 'CREDIT') {
      netBalance += int.parse(amount ?? 0);
    } else if (selection == 'DEBIT') {
      netBalance -= int.parse(amount ?? 0);
    }
    if (dateCells.length == 0) {
      netBalance = 0;
    }
    return netBalance;
  }

  clear() {
    dateCells = [];
    descriptionCells = [];
    amountCells = [];
    netBalance = 0;
    notifyListeners();
  }
}
