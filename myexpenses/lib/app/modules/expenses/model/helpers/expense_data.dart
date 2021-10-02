import 'package:myexpenses/app/data/sql/helpers/data_help.dart';

abstract class ExpenseData {
  static String sqlCreate() {
    const String idField = 'id';
    const String titleField = 'title';
    const String valueField = 'value';
    const String categoryField = 'category';
    const String isPaidOutField = 'isPaidOut';
    const String expireDateField = 'expireDate';
    return '''
    CREATE TABLE expenses (
      $idField $DataHelp.idType,
      $titleField $DataHelp.textType,
      $valueField $DataHelp.doubleType,
      $categoryField $DataHelp.intType,
      $isPaidOutField $DataHelp.boolType,
      $expireDateField $DataHelp.dateType,
    )
    ''';
  }
}
