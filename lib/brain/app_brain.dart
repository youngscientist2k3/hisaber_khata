import 'package:flutter/material.dart';
import 'package:hisaber_khata/storage/local_storage.dart';
import 'package:hisaber_khata/utilities/common_utility.dart';
import 'package:hisaber_khata/utilities/storage_utility.dart';

class AppBrain extends ChangeNotifier {
  String date = CommonUtility().dateTimeNow();
  String description;
  String amount;
  int netBalance = 0;
  String selection;
  List dataList;

  Future<int> get id async {
    return (await LocalStorage.queryRowCount() ?? 0 + 1);
  }

  Future<void> addTransactionTableRow(StorageUtility data) async {
    LocalStorage.insertData(data);
    notifyListeners();
  }

  Future fetchDataBase() async {
    dataList = await LocalStorage.queryAllRows();
    notifyListeners();
  }

  clearCreditDebitField() {
    date = CommonUtility().dateTimeNow();
    amount = null;
    description = null;
  }

  fetchNetBalanceAmount() {
    return netBalance;
  }

  clearNetBalanceAmount() {
    netBalance = 0;
    notifyListeners();
  }
}
