import 'package:myexpenses/app/modules/expenses/model/helpers/category_data.dart';
import 'package:myexpenses/app/modules/expenses/model/helpers/expense_data.dart';

List<String> sqliteCreate() {
  return [
    CategoryDataCreate.sqlCreate(),
    ExpenseDataCreate.sqlCreate(),
  ];
}

// List<String> sqliteInsert() {
//   return [
//     CategoryDataCreate.sqlInsert(),
//     ExpenseDataCreate.sqlInsert(),
//   ];
// }
