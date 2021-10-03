import 'package:myexpenses/app/modules/expenses/model/helpers/category_data.dart';
import 'package:myexpenses/app/modules/expenses/model/helpers/expense_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;
  String databaseName = 'myexpenses.db';

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

  _initDatabase() async {
    String directory = await getDatabasesPath();
    String path = join(directory, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int versao) async {
    await db.execute(_expensesCreate);
    await db.execute(_categoryCreate);
    await db.insert('categorys', _categoryInsert);
  }

  String get _expensesCreate => ExpenseData.sqlCreate();
  String get _categoryCreate => CategoryData.sqlCreate();
  Map<String, dynamic> get _categoryInsert => CategoryData.sqlInsert();
}
