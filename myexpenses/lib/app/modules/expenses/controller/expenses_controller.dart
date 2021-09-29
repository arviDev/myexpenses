import 'package:myexpenses/app/data/data_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';

class ExpensesController {
  DataController dataController;
  String tableName = 'expenses';
  ExpensesController({
    required this.dataController,
  });

  void createExpense(
      String title, String category, double value, DateTime expire,
      {bool paidOut = false}) {
    Expense newExpense = Expense(
      id: 0,
      title: title,
      value: value,
      category: category,
      paidOut: paidOut,
      expire: expire,
    );
    include(newExpense);
  }

  void include(Expense expense) {
    List<Map<String, dynamic>> allExpenses = dataController.readAll(tableName);
    int expenseId = allExpenses.isEmpty ? 0 : allExpenses.length;
    expense.id = expenseId;
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
    expense.title = newTitle;
  }
}
