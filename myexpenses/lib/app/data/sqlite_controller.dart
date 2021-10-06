import 'package:myexpenses/app/data/idata.dart';
import 'package:myexpenses/app/data/sql/db.dart';
import 'package:sqflite/sqflite.dart';

class SqliteController implements Data {
  final dataType = 'relational';

  @override
  Future<void> insert(Map<String, dynamic> map, String tableName) async {
    Database db = await DB.instance.database;
    db.insert(tableName, map);
  }

  @override
  Future<void> delete(Map<String, dynamic> map, String tableName) async {
    Database db = await DB.instance.database;
    db.delete(tableName, where: 'id = ?', whereArgs: [map['id']]);
  }

  @override
  Future<void> update(Map<String, dynamic> map, String tableName) async {
    Database db = await DB.instance.database;
    db.update(tableName, map, where: 'id = ?', whereArgs: [map['id']]);
  }

  @override
  Future<List<Map<String, dynamic>>> read(String tableName) async {
    Database db = await DB.instance.database;
    List<Map<String, Object?>> result = await db.query(tableName);
    return result;
  }
}
