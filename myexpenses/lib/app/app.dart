import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myexpenses/app/data/data_controller.dart';
import 'package:myexpenses/app/home/home_page.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/view/page/expense_add_page.dart';
import 'package:provider/provider.dart';

class MyExpenses extends StatelessWidget {
  const MyExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataController()),
        Provider<CategoryController>(
          create: (_) => CategoryController(
            dataController: DataController(),
          ),
        ),
        Provider<ExpensesController>(
          create: (_) => ExpensesController(
            dataController: DataController(),
            categoryController: CategoryController(
              dataController: DataController(),
            ),
          ),
        ),
      ],
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (ctx) => const HomePage(),
            '/addExpense': (ctx) => const ExpenseAddPage(),
          },
        );
      },
    );
  }
}
