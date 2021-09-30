import 'package:myexpenses/app/data/sql/sql_meta.dart';
import 'package:sqflite/sqflite.dart';

class DataController {
  //database info
  static const String _databaseName = 'myexpenses';
  static const int _databaseVersion = 1;
  SqlMeta sqlMeta = SqlMeta();

  Future<String> path() async {
    String databasesPath = await getDatabasesPath();
    String path = databasesPath + dataBaseName;
    return path;
  }

  void deleteDatabase() async {
    deleteDatabase();
  }

  void open() async {
    String pathData = await path();
    Database database = await openDatabase(pathData, version: 0);
    if (database.getVersion() == 0) {
       
    }
  }

  void createDatabase() async {
    String pathData = await path();
    Database database = await openDatabase(pathData, version: 1, onCreate: (Database db, int version) async {
      await db.execute(SqlMeta.tableExpenses());
    });
  }

  String create

  void insert() {}
  void delete() {}
  void query() {}

  void update() {}
}
