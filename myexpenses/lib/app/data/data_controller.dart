import 'package:flutter/material.dart';
import 'package:myexpenses/app/data/sql/helpers/db.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:sqflite/sqflite.dart';

class DataController extends ChangeNotifier {
  //database info
  static const String _databaseName = 'myexpenses';

  void deleteDatabase() async {
    deleteDatabase();
  }

  void insert(Map<String, dynamic> map) async {
    Database db = await DB.instance.database;
    // Expense newExpense = expense.copyWith();
    // Map<String, dynamic> expenseMap = newExpense.toMap();
    db.insert(_databaseName, map);
    notifyListeners();
  }

  void delete(Expense expense) async {
    Database db = await DB.instance.database;
    db.delete(_databaseName, where: 'id = ?', whereArgs: [expense.id]);
    notifyListeners();
  }

  Future<List<Expense>> query(String column, List args) async {
    Database db = await DB.instance.database;
    List<Map<String, Object?>> result = await db.query(
      _databaseName,
      where: column,
      whereArgs: args,
    );
    List<Expense> expenses = result.map((e) => Expense.fromMap(e)).toList();
    return expenses;
  }

  void update(Map<String, dynamic> map) async {
    Database db = await DB.instance.database;
    db.update(_databaseName, map, where: 'id = ?', whereArgs: [map['id']]);
  }
}
