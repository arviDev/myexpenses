import 'package:myexpenses/app/data/data_controller.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';

class ExpensesController {
  DataController dataController;
  CategoryController categoryController;
  String tableName = 'expenses';
  ExpensesController({
    required this.dataController,
    required this.categoryController,
  });

  void createExpense(
      String title, Category category, double value, DateTime expire,
      {bool paidOut = false}) {
    Expense newExpense = Expense(
      id: 0,
      title: title,
      value: value,
      category: category,
      paidOut: paidOut,
      expire: expire,
    );
    editingExpenses(newExpense);
  }

  int idController() {
    List<Expense> allExpenses = readAllExpenses();
    if (allExpenses.isNotEmpty) {
      return allExpenses.last.id++;
    } else {
      return 0;
    }
  }

  void editingExpenses(Expense expense) {
    Expense newExpense = expense.copyWith();
    newExpense.id = idController();
    Map<String, dynamic> expensesMap = expense.toMap();
    dataController.update(expense.id, expensesMap, tableName);
  }

  void excludeExpense(Expense expense) {
    dataController.delete(tableName, expense.id);
  }

  Expense readExpense(int id) {
    Expense expense = readAllExpenses().where((e) => e.id == id).single;
    return expense;
  }

  List<Expense> readAllExpenses() {
    return dataController
        .readAll(tableName)
        .map((e) => Expense.fromMap(e))
        .toList();
  }

  void changeTitle(String newTitle, Expense expense) {
    Expense changeExpense = expense.copyWith();
    changeExpense.title = newTitle;
    Map<String, dynamic> expenseMap = changeExpense.toMap();
    dataController.update(expense.id, expenseMap, tableName);
  }

  void changeCategory(
    Category newCategory,
    Expense expense,
  ) {
    //TODO: implements newCategory set
  }
  void changeValue(double newValue, Expense expense) {
    Expense changeExpense = expense.copyWith();
    changeExpense.value = newValue;
    Map<String, dynamic> expenseMap = changeExpense.toMap();
    dataController.update(expense.id, expenseMap, tableName);
  }

  void changeExpire(DateTime newExpire, Expense expense) {
    Expense changeExpense = expense.copyWith();
    changeExpense.expire = newExpire;
    Map<String, dynamic> expenseMap = changeExpense.toMap();
    dataController.update(expense.id, expenseMap, tableName);
    expense.expire = newExpire;
  }

  void changePaidOut(bool paidOut, Expense expense) {
    Expense changeExpense = expense.copyWith();
    changeExpense.paidOut = paidOut;
    Map<String, dynamic> expenseMap = changeExpense.toMap();
    dataController.update(expense.id, expenseMap, tableName);
    expense.paidOut = paidOut;
  }
}
