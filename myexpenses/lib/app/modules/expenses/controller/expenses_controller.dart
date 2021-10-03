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

  // Future<int> idController() async {
  //   List<Expense> allExpenses = await readAllExpenses();
  //   if (allExpenses.isNotEmpty) {
  //     return allExpenses.last.id++;
  //   } else {
  //     return 0;
  //   }
  // }

  void insertExpenses(Expense expense) {
    Map<String, dynamic> expenseMap = expense.toMap();
    dataController.insert(expenseMap, tableName);
  }

  void updateExpenses(Expense expense) async {
    Map<String, dynamic> expensesMap = expense.toMap();
    dataController.update(expensesMap, tableName);
  }

  void excludeExpense(Expense expense) {
    Expense newExpense = expense.copyWith();
    newExpense.isActive = false;
    Map<String, dynamic> expenseMap = newExpense.toMap();
    dataController.update(expenseMap, tableName);
  }

  Future<Expense> readExpense(int id) async {
    List<Expense> result = await readAllExpenses();
    Expense expense = result.where((e) => e.id == id).single;
    return expense;
  }

  List<Expense> filterExpense() {
    return [];
  }

  Future<List<Expense>> activeExpense() async {
    List<Expense> expenses = await readAllExpenses();
    List<Expense> activeExpenses = expenses.where((e) => e.isActive).toList();
    return activeExpenses;
  }

  Future<List<Expense>> readAllExpenses() async {
    List<Map<String, dynamic>> result = await dataController.read(tableName);
    return result.map((e) => Expense.fromMap(e)).toList();
  }

  void changeTitle(String newTitle, Expense expense) {
    Expense changeExpense = expense.copyWith();
    changeExpense.title = newTitle;
    Map<String, dynamic> expenseMap = changeExpense.toMap();
    dataController.update(expenseMap, tableName);
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
    dataController.update(expenseMap, tableName);
  }

  void changeExpireDate(DateTime newExpireDate, Expense expense) {
    Expense changeExpense = expense.copyWith();
    changeExpense.expireDate = newExpireDate;
    Map<String, dynamic> expenseMap = changeExpense.toMap();
    dataController.update(expenseMap, tableName);
    expense.expireDate = newExpireDate;
  }

  void changeisPaidOut(bool isPaidOut, Expense expense) {
    Expense changeExpense = expense.copyWith();
    changeExpense.isPaidOut = isPaidOut;
    Map<String, dynamic> expenseMap = changeExpense.toMap();
    dataController.update(expenseMap, tableName);
    expense.isPaidOut = isPaidOut;
  }
}
