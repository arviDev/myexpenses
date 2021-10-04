import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/list_tile_custom.dart';
import 'package:provider/provider.dart';

class FilterExpenses extends StatelessWidget {
  final int categoryId;
  const FilterExpenses({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExpensesController expensesController =
        Provider.of<ExpensesController>(context);
    return FutureBuilder(
      future: expensesController.filterExpenseCategory(categoryId),
      builder: (BuildContext ctx, AsyncSnapshot<List<Expense>> snap) {
        if (snap.hasData && snap.data!.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: snap.data!.length,
            itemBuilder: (_, idx) {
              return ListTileCustom(expense: snap.data![idx]);
            },
          );
        } else {
          return const Center(
              child: Text(
                  'Parece que você não tem despesas para essa categoria! :('));
        }
      },
    );
  }
}
