import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hisaber_khata/utilities/database_utility.dart';
import 'package:hisaber_khata/utilities/storage_utility.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorage {
  static final _databaseName = DatabaseUtility.databaseName;
  static final _databaseVersion = 1;
  static String table = 'my_table';
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
    _database = await initializeDatabase(_databaseName);
    return _database;
  }

  static get database1 async {
    if (_database != null) {
      return _database;
    } else {
      return null;
    }
  }

  static Future<Database> initializeDatabase(String databaseName) async {
    WidgetsFlutterBinding.ensureInitialized();
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  static Future operateExistingDatabase(String databaseName1) async {
    WidgetsFlutterBinding.ensureInitialized();
    String path1 = join(await getDatabasesPath(), databaseName1);
    var database2 = await openDatabase(path1, version: _databaseVersion);
    return database2;
  }

  static Future<bool> checkDatabaseExists(String databaseName1) async {
    String path1 = join(await getDatabasesPath(), databaseName1);
    bool dab = await databaseFactory.databaseExists(path1);
    print(dab);
    return dab;
  }

  // SQL code to create the database table
  static Future _onCreate(Database db, int version) async {
    print('Database Table execution started Sushovan');
    await db.execute(
      "CREATE TABLE $table( $columnId TEXT PRIMARY KEY, $columnDate TEXT, $columnDescription TEXT, $columnAmount DOUBLE, $columnSelection TEXT)",
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

  static Future<int> deleteAllRows() async {
    Database db = await instance.database;
    return await db.delete(table);
  }
}
