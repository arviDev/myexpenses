import 'package:flutter/cupertino.dart';
import 'package:myexpenses/app/data/idata.dart';
import 'package:myexpenses/app/data/sql/db.dart';
import 'package:myexpenses/app/data/sqlite_controller.dart';
import 'package:sqflite/sqflite.dart';

class DataController extends ChangeNotifier {
  final Data database = SqliteController();

  Future<void> insert(Map<String, dynamic> map, String tableName) async {
    database.insert(map, tableName);
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

  Future<List<Map<String, dynamic>>> query(String query) async {
    Database db = await DB.instance.database;
    return db.rawQuery(query);
  }
}
