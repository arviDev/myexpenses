import 'package:myexpenses/app/modules/expenses/model/helpers/category_data.dart';
import 'package:myexpenses/app/modules/expenses/model/helpers/expense_data.dart';

abstract class SqliteCreate {
  static List<String> sqliteCreate() {
    return [
      CategoryDataCreate.sqlCreate(),
      ExpenseDataCreate.sqlCreate(),
    ];
  }

  static List<Map<String, dynamic>> sqliteInsert() {
    return [
      CategoryDataCreate.sqlInsert(),
      //ExpenseDataCreate.sqlInsert(),
    ];
  }
}
