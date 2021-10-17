import 'package:flutter/cupertino.dart';
import 'package:myexpenses/app/data/orm_controller.dart';
import 'package:myexpenses/app/data/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';

class ExpensesController extends ChangeNotifier {
  OrmController ormController;
  CategoryController categoryController;
  String tableName = 'expenses';
  ExpensesController({
    required this.ormController,
    required this.categoryController,
  });

  void createExpense(
      String title, int categoryId, double value, DateTime expireDate) async {
    Expense newExpense = Expense(
      title: title,
      value: value,
      categoryId: categoryId,
      isPaidOut: false,
      expireDate: expireDate,
      isActive: true,
    );
    insertExpenses(newExpense);
  }

  void insertExpenses(Expense expense) {
    Map<String, dynamic> expenseMap = expense.toMap();
    ormController.insert(expenseMap, tableName);
    notifyListeners();
  }

  void updateExpenses(Expense expense) async {
    Map<String, dynamic> expensesMap = expense.toMap();
    ormController.update(expensesMap, tableName);
    notifyListeners();
  }

  void excludeExpense(Expense expense) {
    Expense newExpense = expense.copyWith();
    newExpense.isActive = false;
    updateExpenses(newExpense);
  }

  Future<Expense> readExpense(int id) async {
    List<Expense> result = await readAllExpenses();
    Expense expense = result.where((e) => e.id == id).single;
    return expense;
  }

  Future<List<Expense>> activeExpense() async {
    List<Expense> expenses = await readAllExpenses();
    List<Expense> activeExpenses = expenses.where((e) => e.isActive).toList();
    return activeExpenses;
  }

  Future<List<Expense>> filterExpense(String value) async {
    List<Expense> expenses = await readAllExpenses();
    List<Expense> filterExpenses = expenses
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
    return filterExpenses;
  }

  Future<List<Expense>> filterExpenseCategory(int categoryId) async {
    List<Expense> expenses = await readAllExpenses();
    List<Expense> filterExpenses =
        expenses.where((e) => e.categoryId == categoryId).toList();
    notifyListeners();
    return filterExpenses;
  }

  Future<List<Expense>> readAllExpenses() async {
    List<Map<String, dynamic>> result = await ormController.read(tableName);
    return result.map((e) => Expense.fromMap(e)).toList();
  }

  void changeTitle(String newTitle, Expense expense) {
    Expense changedExpense = expense.copyWith();
    changedExpense.title = newTitle;
    updateExpenses(changedExpense);
  }

  // void queryAll() async {
  //   //Future<Map<Expense, Category>>
  //   String query = ('''
  //   SELECT e.title, c.title as ctitle, c.color
  //   FROM expenses as e
  //   INNER JOIN  categorys as c ON
  //   c.id == e.categoryId
  //   ''');
  //   List<Map<String, dynamic>> allquery = await ormController.query(query);
  //   print(allquery);
  // }

  void changeCategory(
    Category newCategory,
    Expense expense,
  ) {
    //TODO: implements newCategory set
  }
  void changeValue(double newValue, Expense expense) {
    Expense changedExpense = expense.copyWith();
    changedExpense.value = newValue;
    updateExpenses(changedExpense);
  }

  void changeExpireDate(DateTime newExpireDate, Expense expense) {
    Expense changedExpense = expense.copyWith();
    changedExpense.expireDate = newExpireDate;
    updateExpenses(changedExpense);
  }

  void changeisPaidOut(bool isPaidOut, Expense expense) {
    Expense changedExpense = expense.copyWith();
    changedExpense.isPaidOut = isPaidOut;
    updateExpenses(changedExpense);
  }
}
