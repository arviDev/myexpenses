abstract class SqlMeta {
  static String tableExpenses() {
    //table expense info
    const String tableExpensesName = 'myexpenses';
    const String columnId = 'id';
    const String columnTitle = 'title';
    const String columnValue = 'value';
    const String columnCategory = 'categoryId';
    const String columnPaidOut = 'paidOut';
    const String columnExpire = 'expire';

    String sqlString = '''
    CREATE TABLE $tableExpensesName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTitle TEXT NOT NULL,
      $columnValue NUMBER NOT NULL,
      FOREIGN KEY $columnCategory  
      REFERENCES categorys (id) 
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
      $columnPaidOut INTEGER NOT NULL,
      $columnExpire TEXT NOT NULL,
    )
    ''';

    return sqlString;
  }
}
