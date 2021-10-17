import 'package:flutter/material.dart';
import 'package:myexpenses/app/data/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/list_tile_custom.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatefulWidget {
  final Future<List<Expense>> list;
  const ExpensesList({Key? key, required this.list}) : super(key: key);

  @override
  _ExpensesListState createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Provider.of<CategoryController>(context);

    List<Category>? categorys;

    Future<void> getCategorys() async {
      categorys = await categoryController.readAllCategory();
    }

    return FutureBuilder(
      future: widget.list,
      builder: (BuildContext ctx, AsyncSnapshot<List<Expense>> snap) {
        if (snap.hasData && snap.data!.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: snap.data!.length,
            itemBuilder: (_, idx) {
              getCategorys();
              print(categorys!.length);
              return ListTileCustom(expense: snap.data![idx]);
            },
          );
        } else {
          return const Center(
              child: Text('Parece que você ainda não lançou despesas! :('));
        }
      },
    );
  }
}
