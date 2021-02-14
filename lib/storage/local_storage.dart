import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hisaber_khata/utilities/storage_utility.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorage {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;
  static final table = 'my_table';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnDescription = 'description';
  static final columnAmount = 'amount';
  static final columnSelection = 'selection';
  static final columnDate = 'date';
  static Database _database;

  LocalStorage._privateConstructor();
  static final LocalStorage instance = LocalStorage._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initializeDatabase();
    return _database;
  }

  static Future<Database> _initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  static Future _onCreate(Database db, int version) async {
    print('Database Table execution started Sushovan');
    await db.execute(
      "CREATE TABLE $table( $columnId TEXT PRIMARY KEY, $columnDate TEXT, $columnDescription TEXT, $columnAmount TEXT, $columnSelection TEXT)",
    );
    print('Database Table has been successfully Executed Sushovan');
  }
  //TODO: may be the table is not getting created

  static Future insertData(StorageUtility data) async {
    Database db = await instance.database;
    if (db != null) {
      return await db.insert(table, data.toMap());
    } else {
      print('database not available');
    }
  }

  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  static Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  static Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  static Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
