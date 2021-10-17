import 'package:myexpenses/app/data/inicializer.dart';
import 'package:myexpenses/app/data/sql/sqlite/sqlite_create.dart';
import 'package:sqflite/sqflite.dart';

class SqliteInicializer implements InicializerDatabase {
  SqliteInicializer._();
  static final SqliteInicializer instance = SqliteInicializer._();
  static Database? _database;
  String databaseName = 'myexpenses.db';

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await onInitializer();
  }

  @override
  Future<Database> onInitializer() async {
    String directory = await getDatabasesPath();
    String path = directory + databaseName;
    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreateDocs,
    );
  }

  @override
  Future<void> onCreateDocs(dynamic database, int version) async {
    List<String> creates = SqliteCreate.sqliteCreate();
    for (var create in creates) {
      await database.execute(create);
    }
    onInsertDocs(database, 'categorys', SqliteCreate.sqliteInsert());
  }

  Future<void> onInsertDocs(
    dynamic database,
    String tableName,
    List<Map<String, dynamic>> inserts,
  ) async {
    for (var insert in inserts) {
      await database.insert(tableName, insert);
    }
  }
}
