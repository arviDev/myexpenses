import 'package:flutter/material.dart';
import 'package:myexpenses/app/data/sql/db.dart';
import 'package:sqflite/sqflite.dart';

class DataController extends ChangeNotifier {
  void deleteDatabase() async {
    deleteDatabase();
  }

  void insert(Map<String, dynamic> map, String tableName) async {
    Database db = await DB.instance.database;
    db.insert(tableName, map);
    notifyListeners();
  }

  void delete(Map<String, dynamic> map, String tableName) async {
    Database db = await DB.instance.database;
    db.delete(tableName, where: 'id = ?', whereArgs: [map['id']]);
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> read(String tableName) async {
    Database db = await DB.instance.database;
    List<Map<String, Object?>> result = await db.query(tableName);
    return result;
  }

  void update(Map<String, dynamic> map, String tableName) async {
    Database db = await DB.instance.database;
    db.update(tableName, map, where: 'id = ?', whereArgs: [map['id']]);
    notifyListeners();
  }
}
