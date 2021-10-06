import 'package:myexpenses/app/data/inicializer.dart';
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
  String onCreateDocs() {}

  _onCreate(Database db, int versao) async {
    await db.execute(_expensesCreate);
    await db.execute(_categoryCreate);
    await db.insert('categorys', _categoryInsert);
  }

  String get _expensesCreate => ExpenseData.sqlCreate();
  String get _categoryCreate => CategoryData.sqlCreate();
  Map<String, dynamic> get _categoryInsert => CategoryData.sqlInsert();
}
