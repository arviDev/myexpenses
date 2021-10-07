import 'package:flutter/cupertino.dart';
import 'package:myexpenses/app/data/data.dart';
import 'package:myexpenses/app/data/sql/sqlite/sqlite_controller.dart';

class OrmController extends ChangeNotifier {
  final IData database = SqliteController();
  //final Data database = HiveController();

  Future<void> insert(Map<String, dynamic> map, String tableName) async {
    database.insert(map, tableName);
    notifyListeners();
  }

  Future<void> delete(Map<String, dynamic> map, String tableName) async {
    await database.delete(map, tableName);
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> read(String tableName) async {
    List<Map<String, dynamic>> result = await database.read(tableName);
    return result;
  }

  void update(Map<String, dynamic> map, String tableName) async {
    database.update(map, tableName);
    notifyListeners();
  }
}
