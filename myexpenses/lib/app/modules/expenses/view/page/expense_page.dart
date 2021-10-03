import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/fab_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/components/list_tile_custom.dart';
import 'package:provider/provider.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  Widget build(BuildContext context) {
    ExpensesController expensesController =
        Provider.of<ExpensesController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('my expenses'),
      ),
      body: FutureBuilder(
        future: expensesController.activeExpense(),
        builder: (BuildContext ctx, AsyncSnapshot<List<Expense>> snap) {
          if (!snap.hasData) {
            return const Center(
                child: Text('Parece que você ainda não lançou despesas! :('));
          } else {
            return ListView.builder(
              itemCount: snap.data!.length,
              itemBuilder: (_, idx) {
                return ListTileCustom(title: snap.data![idx].title);
              },
            );
          }
        },
      ),
      floatingActionButton: const FABCustom(),
    );
  }
}
