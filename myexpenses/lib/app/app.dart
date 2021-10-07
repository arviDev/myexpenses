import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myexpenses/app/data/orm_controller.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/view/page/category_page.dart';
import 'package:myexpenses/app/modules/expenses/view/page/expense_page.dart';
import 'package:provider/provider.dart';

class MyExpenses extends StatelessWidget {
  const MyExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataController()),
        ChangeNotifierProvider<CategoryController>(
          create: (_) => CategoryController(
            dataController: DataController(),
          ),
        ),
        ChangeNotifierProvider<ExpensesController>(
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
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (ctx) => const ExpensePage(),
            '/category': (ctx) => const CategoryPage(),
          },
        );
      },
    );
  }
}
