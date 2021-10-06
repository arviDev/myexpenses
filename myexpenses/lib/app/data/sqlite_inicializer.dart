import 'package:myexpenses/app/data/inicializer.dart';
import 'package:myexpenses/app/data/sqlite_create.dart';
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
      onCreate: _onCreate,
    );
  }

  @override
  void onCreateDocs(dynamic database, List<String> docsCreate) async {
    //create tables
    await database.execute(_expensesCreate);
    await database.execute(_categoryCreate);
    await database.insert('categorys', _categoryInsert);
  }

  void _onCreate(Database database, int versao) async {
    List<String> creates = sqliteCreate();
    List<String> inserts = sqliteCreate();
    for (var create in creates) {
      database.execute(create);
    }
  }

  String get _expensesCreate => ExpenseData.sqlCreate();
  String get _categoryCreate => CategoryData.sqlCreate();
  Map<String, dynamic> get _categoryInsert => CategoryData.sqlInsert();
}
