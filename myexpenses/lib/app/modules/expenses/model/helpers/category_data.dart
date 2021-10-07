import 'package:myexpenses/app/data/sql/data_help_sql.dart';

abstract class CategoryDataCreate {
  static String sqlCreate() {
    const String idField = 'id';
    const String titleField = 'title';
    const String colorField = 'color';
    const String isActive = 'isActive';
    return '''
    CREATE TABLE categorys (
      $idField ${DataHelp.idType},
      $titleField ${DataHelp.textType},
      $colorField ${DataHelp.textType},
      $isActive ${DataHelp.boolType}
    )
    ''';
  }

  static Map<String, dynamic> sqlInsert() {
    return {
      'title': 'Supermercado',
      'color': '06D6A0',
      'isActive': 1,
    };
  }
}
