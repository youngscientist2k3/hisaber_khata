import 'package:flutter/material.dart';
import 'package:hisaber_khata/storage/local_storage.dart';
import 'package:hisaber_khata/utilities/common_utility.dart';
import 'package:hisaber_khata/utilities/storage_utility.dart';

class AppBrain extends ChangeNotifier {
  String date = CommonUtility().dateTimeNow();
  String description;
  double amount;
  double netBalance = 0.00;
  String selection;
  List<Map<String, dynamic>> dataList = [];
  String netAmount;

  Future<int> get id async {
    return (await LocalStorage.queryRowCount() ?? 0 + 1);
  }

  Future<void> addTransactionTableRow(StorageUtility data) async {
    LocalStorage.insertData(data);
    dataList = await LocalStorage.queryAllRows();
    notifyListeners();
  }

  Future fetchDataBase() async {
    dataList = await LocalStorage.queryAllRows();
    notifyListeners();
  }

  clearCreditDebitField() {
    //in common utility
    date = CommonUtility().dateTimeNow();
    amount = null;
    description = null;
  }

  fetchNetBalanceAmount() {
    // in netbalance component
    netBalance = 0.00;
    if (dataList != []) {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i]['selection'] == 'CREDIT') {
          netBalance += double.parse(dataList[i]['amount']);
        } else if (dataList[i]['selection'] == 'DEBIT') {
          netBalance -= double.parse(dataList[i]['amount']);
        }
      }
      return '$netBalance';
    } else {
      return '';
    }
  }

  clearNetBalanceAmount() {
    netBalance = 0;
    LocalStorage.deleteAllRows();
    dataList = [];
    notifyListeners();
  }
}
