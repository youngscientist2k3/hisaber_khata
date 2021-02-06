import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hisaber_khata/utilities/storage_utility.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorage {
  Future<Database> dataBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'data_table_database.db'),
      onCreate: createDataBase,
      version: 1,
    );
  }

  Future<Database> createDataBase(db, version) {
    return db.execute(
      "CREATE TABLE dataTable(id INTEGER PRIMARY KEY, date TEXT, description TEXT, amount TEXT,selection TEXT)",
    );
  }

  Future<void> insertData(StorageUtility data) async {
    final Database db = await dataBase();
    await db.insert(
      'data',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<StorageUtility>> dataList() async {
    // Get a reference to the database.
    final Database db = await dataBase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('data');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return StorageUtility(
        id: maps[i]['id'],
        date: maps[i]['date'],
        description: maps[i]['description'],
        amount: maps[i]['amount'],
      );
    });
  }

  Future<void> updateData(StorageUtility data) async {
    final db = await dataBase();
    await db.update(
      'data',
      data.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [data.id],
    );
  }

  Future<void> deleteData(int id) async {
    // Get a reference to the database.
    final db = await dataBase();

    // Remove the Dog from the database.
    await db.delete(
      'data',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
