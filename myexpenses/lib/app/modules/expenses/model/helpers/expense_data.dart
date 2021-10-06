import 'package:myexpenses/app/data/sql/data_help.dart';

abstract class ExpenseDataCreate {
  static String sqlCreate() {
    const String idField = 'id';
    const String titleField = 'title';
    const String valueField = 'value';
    const String categoryField = 'categoryId';
    const String isPaidOutField = 'isPaidOut';
    const String expireDateField = 'expireDate';
    const String isActive = 'isActive';
    return '''
    CREATE TABLE expenses (
      $idField ${DataHelp.idType},
      $titleField ${DataHelp.textType},
      $valueField ${DataHelp.doubleType},
      $categoryField ${DataHelp.intType},
      $isPaidOutField ${DataHelp.boolType},
      $expireDateField ${DataHelp.dateType},
      $isActive ${DataHelp.boolType}
    )
    ''';
  }
}
