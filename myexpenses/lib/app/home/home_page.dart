import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ExpensesController expensesController =
        Provider.of<ExpensesController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('my expenses'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: expensesController.activeExpense(),
        builder: (BuildContext ctx, AsyncSnapshot<List<Expense>> snap) {
          if (snap.data == null) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (_, idx) {
                  return ListTile(
                    title: Text(snap.data![idx].title),
                  );
                });
          }
        },
      ),
    );
  }
}
