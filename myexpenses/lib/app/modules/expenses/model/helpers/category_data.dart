import 'package:myexpenses/app/data/sql/helpers/data_help.dart';

abstract class CategoryData {
  static String sqlCreate() {
    const String idField = 'id';
    const String titleField = 'title';
    const String colorField = 'color';
    return '''
    CREATE TABLE expenses (
      $idField $DataHelp.idType,
      $titleField $DataHelp.textType,
      $colorField $DataHelp.textType,
    )
    ''';
  }
}
